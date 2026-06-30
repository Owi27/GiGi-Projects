// Unnamed technique, shader ShadowVertex
/*$(ShaderResources)*/

struct VSInput
{
	float3 position   : POSITION;
	uint   vertexID   : SV_VertexID;
	uint   instanceId : SV_InstanceID;
	//TODO: fill this out
};

struct VSOutput // AKA PSInput
{
	float4 position   : SV_POSITION;
	//TODO: fill this out
};

VSOutput main(VSInput input)
{
	VSOutput ret = (VSOutput)0;
	ret.position = mul(float4(input.position, 1.0f), /*$(Variable:ViewProjMtx)*/);
	// TODO: fill this out
	return ret;
}
