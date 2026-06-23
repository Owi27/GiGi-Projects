// Unnamed technique, shader Playground
/*$(ShaderResources)*/

#define OCTAVES 7
#define res float2(1796, 1019)

float2 Hash(float2 p)
{
    p = float2(dot(p, float2(127.1, 311.7)), dot(p, float2(269.5, 183.3)));
    return -1.f + 2.f * frac(sin(p) * 43758.5453123);
}

float Noise(float2 p)
{
    const float K1 = 0.366025404; // (sqrt(3)-1)/2;
    const float K2 = 0.211324865; // (3-sqrt(3))/6;

    float2 i = floor(p + (p.x + p.y) * K1);
    float2 a = p - i + (i.x + i.y) * K2;
    float m = step(a.y, a.x);
    float2 o = float2(m, 1.0 - m);
    float2 b = a - o + K2;
    float2 c = a - 1.0 + 2.0 * K2;
    float3 h = max(0.5 - float3(dot(a, a), dot(b, b), dot(c, c)), 0.0);
    float3 n = h * h * h * h * float3(dot(a, Hash(i + 0.0)), dot(b, Hash(i + o)), dot(c, Hash(i + 1.0)));
    return dot(n, float3(70.f, 70.f, 70.f));
}

//float FBM(float2 x, float h) //purest form of fbm, pow is expensive
//{
//    //use noise to construct self-similarity
//    float t = 0.f;
//
//    for (int i = 0; i < OCTAVES; i++)
//    {
//        float f = pow(2.f, float(i));
//        float a = pow(f, -h);
//        //t += a * noise(f * x);
//        t += a * Noise(f * x);
//    }
//
//    return t;
//}

float FBM(float2 x, float h) //same as above, less expensive
{
    float G = exp2(-h);
    float f = 1.f;
    float a = 1.f;
    float t = 0.f;
    
    for (int i = 0; i < OCTAVES; i++)
    {
        t += a * Noise(f * x);
        f *= 2.f;
        a *= G;
    }

    return t;
}

float2 Flow(float2 p, float t)
{
    float n = FBM(p * 0.5 + t * 0.05, 0.7);
    return p + float2(cos(n), sin(n)) * 0.3;
}

float Pattern(float2 p)
{
  //  p = Flow(p, _Playground_0CB.iTime);
    float2 q = float2(FBM(p, .777f), FBM(p + float2(6.27, 7.3), .777f));
    float2 r = float2(FBM(p + q, .777f), FBM(p + q, .777f));
    float2 s = float2(FBM(p + r + float2(6.08, 7.14), .777f), FBM(p + r, .777f));
    
    //return FBM(p + s, .777f);
    return FBM(p + r, .777f);
}

float Hash21(float2 p)
{
    p = frac(p * float2(123.34, 456.21));
    p += dot(p, p + 45.32);
    
    return frac(p.x * p.y);
}

/*$(_compute:main)*/(uint3 DTid : SV_DispatchThreadID)
{
float2 uv = (DTid.xy + 0.5) / res;

    if (Input[DTid.xy].a > 0.f)
{
float luminance = dot(Input[DTid.xy].rgb, float3(0.2126, 0.7152, 0.0722));
        Output[DTid.xy] = float4(Input[DTid.xy].rgb, luminance);
}
else Output[DTid.xy] = float4(0.f, 0.f, 0.f, 1.f);
//        //Output[DTid.xy] = float4(PatterN(uv), 1.f);
        
        //Output[DTid.xy] = float4(lerp(float3((float)255/255, (float)183/255, (float)197/255), float3(0, 0, 0), Pattern(uv)), 1.f);
        //Output[DTid.xy] = float4(lerp(float3(1, 1, 1), float3(0, 0,0 ), Pattern(uv)), 1.f);
        //Output[DTid.xy] = float4(lerp(float3(0.83529f, 0.73725f, 0.75686f), float3(0.33333f, 0.13725f, 0.17647f), Pattern(uv)), 1.f);
        //Output[DTid.xy] = float4(abs(sin(_Playground_0CB.iTime)), (sin(_Playground_0CB.iTime - .25f)), 0.f, 1.f);
    //Output[DTid.xy] = float4(Hash21(uv + .11f), Hash21(uv + .37f), Hash21(uv + .73f), 1.f);
}

/*
Shader Resources:
	Texture Tex (as SRV)
	Texture Output (as UAV)
*/
