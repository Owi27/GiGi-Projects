// Unnamed technique, shader ShadowFragment
/*$(ShaderResources)*/

struct PSInput // AKA VSOutput
{
	float4 position   : SV_POSITION;
	//TODO: fill this out
};

struct PSOutput
{
	float4 colorTarget : SV_Target0;
	//TODO: fill this out
};

PSOutput main(PSInput input)
{
	PSOutput ret = (PSOutput)0;
	// TODO: fill this out
	return ret;
}

/*
Shader Resources:
	Buffer PointLights (as SRV)
	Texture ShadowCubeMap (as UAV)
*/
