// Unnamed technique, shader ShadowFragment
/*$(ShaderResources)*/

struct PSInput // AKA VSOutput
{
    float4 position : SV_POSITION;
	//TODO: fill this out
    float3 wPos : TEXCOORD0;
};

struct PSOutput
{
    float4 colorTarget : SV_Target0;
	//TODO: fill this out
};

PSOutput main(PSInput input)
{
    PSOutput ret = (PSOutput) 0;
	// TODO: fill this out
    float dist = length(input.wPos - PointLights[0].Pos);
    float d = saturate(dist / PointLights[0].Range);

    ret.colorTarget = float4(d, d, d, 1.0f);
    return ret;
}

/*
Shader Resources:
	Buffer PointLights (as SRV)
	Texture ShadowCubeMap (as UAV)
*/
