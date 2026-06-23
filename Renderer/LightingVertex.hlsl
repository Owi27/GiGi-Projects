// Unnamed technique, shader Lighting
/*$(ShaderResources)*/

struct VSInput
{
	uint   vertexID   : SV_VertexID;
	//TODO: fill this out
};

struct VSOutput // AKA PSInput
{
	float4 position   : SV_POSITION;
	//TODO: fill this out
    float2 UV : TEXCOORD0;
};

VSOutput main(VSInput input)
{
	VSOutput ret = (VSOutput)0;
	// TODO: fill this out
    ret.UV = float2((input.vertexID << 1) & 2, input.vertexID & 2);
    ret.position = float4(ret.UV * 2.0f - 1.0f, 0.0f, 1.0f);
	return ret;
}
