// Unnamed technique, shader LightingFragment
/*$(ShaderResources)*/

struct PSInput // AKA VSOutput
{
	float4 position   : SV_POSITION;
	//TODO: fill this out
    float2 UV : TEXCOORD0;
};

struct PSOutput
{
	float4 colorTarget : SV_Target0;
	//TODO: fill this out
};

float3 Decode(float2 f)
{
    f = f * 2.0 - 1.0;
 
    // https://twitter.com/Stubbesaurus/status/937994790553227264
    float3 n = float3(f.x, f.y, 1.0 - abs(f.x) - abs(f.y));
    float t = saturate(-n.z);
    n.xy += select(n.xy >= 0.0, -t, t);
    return normalize(n);
}

PSOutput main(PSInput input)
{
	PSOutput ret = (PSOutput)0;
	// TODO: fill this out
    ret.colorTarget = float4(1.f, 1.f, 1.f, 1.f);
	return ret;
}

/*
Shader Resources:
	Buffer Lights (as SRV)
	Texture Albedo (as SRV)
	Texture Normal (as SRV)
	Texture Material (as SRV)
	Texture Emissive (as SRV)
	Texture Velocity (as SRV)
	Texture Depth (as SRV)
*/
