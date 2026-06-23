// Unnamed technique, shader Playground
/*$(ShaderResources)*/

float Remap(float pX, float2 pInMinMax, float2 pOutMinMax)
{
    return pOutMinMax.x + (pX - pInMinMax.x) * (pOutMinMax.y - pOutMinMax.x) / max(pInMinMax.y - pInMinMax.x, .00001f);
}

float RandomRange(float2 pSeed, float pMinValue, float pMaxValue)
{
    float r = frac(sin(dot(pSeed, float2(12.9898f, 78.233f))) * 43758.5453f);
    
    return lerp(pMinValue, pMaxValue, r);
}


//hash test
uint MurMurHash12(uint2 src)
{
    const uint M = 0x5bd1e995u;
    uint h = 1190494759u;
    src *= M;
    src ^= src >> 24u;
    src *= M;
    h *= M;
    h ^= src.x;
    h *= M;
    h ^= src.y;
    h ^= h >> 13u;
    h *= M;
    h ^= h >> 15u;
    return h;
}






float Hash21(float2 pP)
{
    uint h = MurMurHash12(asuint(pP));
    return asfloat(h & 0x007fffffu | 0x3f800000u) - 1.0;
    //pP = frac(pP * float2(123.34f, 456.21f));
    //pP += dot(pP, pP + 45.32f);

    //return frac(pP.x * pP.y);
    float3 p3 = frac(float3(pP.xyx) * .1031);
    p3 += dot(p3, p3.yzx + 33.33);
    
    return frac((p3.x + p3.y) * p3.z);

}

float2 GradientDir(float2 pP)
{
    float x = Hash21(pP) * 6.2831853f;

    return float2(cos(x), sin(x));
}

float GradientNoise(float2 pUV, float pScale)
{
    float2 p = pUV * pScale;
    float2 ip = floor(p);
    float2 fp = frac(p);

    float d00 = dot(GradientDir(ip), fp);
    float d01 = dot(GradientDir(ip + float2(0.f, 1.f)), fp - float2(0.f, 1.f));
    float d10 = dot(GradientDir(ip + float2(1.f, 0.f)), fp - float2(1.f, 0.f));
    float d11 = dot(GradientDir(ip + float2(1.f, 1.f)), fp - float2(1.f, 1.f));

    fp = fp * fp * fp * (fp * (fp * 6.f - 15.f) + 10.f);

    return lerp(lerp(d00, d01, fp.y), lerp(d10, d11, fp.y), fp.x) + .5f;
}

float FourthOctaveNoise(float2 pUV, float pScale)
{
    float n0 = GradientNoise(pUV, pScale);
    float n1 = GradientNoise(pUV, pScale * 2.f) / 2.f;
    float n2 = GradientNoise(pUV, pScale * 4.f) / 4.f;
    float n3 = GradientNoise(pUV, pScale * 8.f) / 8.f;

    float total = n0 + n1 + n2 + n3;

    return Remap(total, float2(0.f, 1.875f), float2(0.f, 1.f));
}

float SixOctaveNoise(float2 pUV, float pScale, float2 pMoveDir, float2 pOffset, float2 pTiling, bool pOppose, float pDivisor, float pStartingStrength)
{
    //float2 timeOffset = /*$(Variable:iTime)*/ * pMoveDir + pOffset;
    float2 timeOffset = (float( /*$(Variable:iFrame)*/) / 120.f) * pMoveDir + pOffset;
    
    float2 uvA = pUV * pTiling + timeOffset;
    
    float2 oppositeOffset = -timeOffset;
    float2 branchOffset = pOppose ? oppositeOffset : timeOffset;
    
    float2 uvB = pUV * pTiling + branchOffset;
    
    float divisorSafe = max(pDivisor, .0001f);
    float strengthSafe = max(pStartingStrength, .0001f);
    
    float n0 = GradientNoise(uvA, pScale);
    
    float scale1 = pScale / divisorSafe;
    float n1 = GradientNoise(uvB, scale1) / strengthSafe;

    float scale2 = scale1 / divisorSafe;
    float n2 = GradientNoise(uvA, scale2) / (strengthSafe * 2.f);

    float scale3 = scale2 / divisorSafe;
    float n3 = GradientNoise(uvB, scale3) / (strengthSafe * 4.f);

    float scale4 = scale3 / divisorSafe;
    float n4 = GradientNoise(uvA, scale4) / (strengthSafe * 8.f);

    float scale5 = scale4 / divisorSafe;
    float n5 = GradientNoise(uvB, scale5) / (strengthSafe * 16.f);

    // Unity graph divided by 1.9375
    return (n0 + n1 + n2 + n3 + n4 + n5) / 1.9375f;
}

float GenerateHeightMask(float2 pUV)
{
    float2 movedDir = float2(1.f, 1.f) * .15f;
    
    float noise = SixOctaveNoise(pUV, 2.f, movedDir, float2(0.f, 0.f), float2(2.5, 2.f), true, .56f, 6.1f);
    
    float bandPower = pow(100, noise * 1.f);
    float banded = fmod(noise * bandPower, 1.f);
    
    float widthMask = .2f * pow(noise, 1.25f);
    
    return banded < widthMask ? 1.f : 0.f;
}


float Luminance(float3 pColor)
{
    return dot(pColor, float3(.2126f, .7152f, .0722f));
}

float2 ClampUV(float2 pUV)
{
    return saturate(pUV);
}

float3 SRGBToLinear(float3 c)
{
    return float3(
        c.r <= 0.04045f ? c.r / 12.92f : pow((c.r + 0.055f) / 1.055f, 2.4f),
        c.g <= 0.04045f ? c.g / 12.92f : pow((c.g + 0.055f) / 1.055f, 2.4f),
        c.b <= 0.04045f ? c.b / 12.92f : pow((c.b + 0.055f) / 1.055f, 2.4f)
    );
}

float3 BG(float2 pUV)
{
    float mask = GenerateHeightMask(pUV);

    float3 finalColor = /*$(Variable:Color)*/.rgb;
    return float3(lerp(SRGBToLinear(float3(10.f / 255.f, 10.f / 255.f, 10.f / 255.f)), /*$(Variable:Color)*/.rgb, mask.x));

}
/*$(_compute:main)*/(uint3 DTid : SV_DispatchThreadID)
{
uint2 pixel = DTid.xy;

float2 uv = (float2(pixel) + .5f) / /*$(Variable:iResolution)*/.xy;

float3 backgroundColor = BG(uv);

float2 screenUV = uv;

//float2 noiseOffset = /*$(Variable:NoiseMoveVec)*/ * /*$(Variable:iTime)*/;
float2 noiseOffset = /*$(Variable:NoiseMoveVec)*/ * (float( /*$(Variable:iFrame)*/) / 120.f);

float2 noiseUV = screenUV + noiseOffset;

float noiseX = FourthOctaveNoise(noiseUV, /*$(Variable:NoiseScale)*/);
    noiseX = Remap(noiseX, float2(0.f, 1.f), float2(-1.f, 1.f));

float noiseY = FourthOctaveNoise(noiseUV + float2(0.f, 3.f), /*$(Variable:NoiseScale)*/);
    noiseY = Remap(noiseY, float2(0.f, 1.f), float2(-1.f, 1.f));

float2 noiseVector = float2(noiseX, noiseY) * /*$(Variable:NoiseAdd)*/;

float randX = RandomRange(uv, 0.f, 1.f);
float randY = RandomRange(uv + float2(0.f, 1.f), 0.f, 1.f);
float2 randomBlur =float2(randX, randY) * /*$(Variable:BlurFactor)*/;


float2 baseDistortedUV = screenUV + noiseVector + randomBlur;

float4 mainSample = float4(1.f, 1.f, 1.f, 1.f); //float4(Hash21(uv + .11f), Hash21(uv + .37f), Hash21(uv + .73f), Tex[pixel].a);

float mainMask = pow(saturate(mainSample.r), /*$(Variable:Pow)*/);

float2 dir = float2(.5f, .5f) - uv;
float distFromCenter = length(dir);
dir = dir * distFromCenter;

    if (/*$(Variable:FlipDirectionVec)*/ > .5f)
    {
        dir = -dir;
    }

float2 refractionOffset = dir * mainMask * /*$(Variable:RefractionStrength)*/;
float2 refractedUV = baseDistortedUV + refractionOffset;

float3 sceneColor = SceneColor.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, ClampUV(refractedUV), 0).rgb;

//sceneColor = lerp(/*$(Variable:GradientA)*/, /*$(Variable:GradientB)*/, Luminance(sceneColor));
float colorSplitMask = 0.f;

    if (/*$(Variable:MainTexAsColorSplit)*/ > .5f)
    {
        colorSplitMask = mainMask;
    }
    else
    {
float colorSplitTexValue = ColorSplit.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv, 0).r;

        colorSplitMask = pow(saturate(colorSplitTexValue), /*$(Variable:ColorSplitPow)*/);
    }

float2 splitDirection = dir * colorSplitMask;

float2 redUV = refractedUV - splitDirection * /*$(Variable:ColorSplit)*/;
float red = SceneColor.SampleLevel( /*$(Sampler:linear:linear:linear:wrap)*/, redUV, 0).r; //sceneColor.r;

float2 greenUV = refractedUV - splitDirection * /*$(Variable:ColorSplit)*/;
float green = sceneColor.g; //SceneColor.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, ClampUV(greenUV), 0).g;

float2 blueUV = refractedUV + splitDirection * /*$(Variable:ColorSplit)*/;
float blue = SceneColor.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, blueUV, 0).b;

float3 splitColor = float3(red, 0, 0);

float lum = Luminance(splitColor);

    if (/*$(Variable:CutLum)*/ > .5f && lum > /*$(Variable:MaxLumCutoff)*/)
    {
        splitColor = /*$(Variable:CutLumCol)*/.rgb;
    }

splitColor = lerp(/*$(Variable:GradientA)*/, /*$(Variable:GradientB)*/, Luminance(splitColor));
//splitColor = lerp(/*$(Variable:GradientA)*/, float3(Hash21(uv + .11f), Hash21(uv + .37f), Hash21(uv + .73f)), Luminance(splitColor));
float3 finalColor = splitColor * /*$(Variable:BackColorMult)*/;
    finalColor = pow(saturate(finalColor), /*$(Variable:BackColorPow)*/);

    finalColor = lerp(finalColor, /*$(Variable:Tint)*/.rgb, /*$(Variable:Tint)*/.a);
    finalColor = saturate(finalColor);

float3 foregroundColor = finalColor;
//Output[pixel] = float4(lerp(backgroundColor, foregroundColor, ), 1.f);

float foregroundAlpha = saturate(Luminance(foregroundColor));
float3 composited = lerp(backgroundColor, foregroundColor, foregroundAlpha);
//Output[pixel] = float4(composited, 1.f); //<---ACTIVATE BG

float3 inverted = finalColor;
    if (/*$(Variable:Invert)*/ > .5f)
    {
        inverted = 1.f - finalColor;
    }

    Output[pixel] = float4(finalColor, 1.f);//float4(lerp(finalColor, inverted, abs(sin(/*$(Variable:iTime)*/ - .25f))), 1.f);
}

/*
Shader Resources:
	Texture Tex (as SRV)
	Texture Output (as UAV)
	Texture SceneColor (as SRV)
	Texture ColorSplit (as SRV)
Shader Samplers:
	LinearWrap filter: MinMagMipLinear addressmode: Wrap
*/
