// Unnamed technique, shader RendererVertex
/*$(ShaderResources)*/

struct VSInput
{
	float3 position   : POSITION;
	uint   vertexID   : SV_VertexID;
	uint   instanceId : SV_InstanceID;
	//TODO: fill this out
    float4 color : COLOR;
    float3 normal : NORMAL;
    float4 tangent : TANGENT;
    float4 texCoord0 : TEXCOORD0;
    float4 texCoord1 : TEXCOORD1;
    float4 texCoord2 : TEXCOORD2;
    float4 texCoord3 : TEXCOORD3;
    int materialID : TEXCOORD4;
    int shapeID : TEXCOORD5;
};

struct VSOutput // AKA PSInput
{
	float4 position   : SV_POSITION;
    float3 wPos : POSITION;
	//TODO: fill this out
    float4 color : COLOR;
    float3 normal : NORMAL;
    float4 tangent : TANGENT;
    float2 texCoord0 : TEXCOORD0;
    int materialID : TEXCOORD1;
};

VSOutput main(VSInput input)
{
	VSOutput ret = (VSOutput)0;
    ret.position = mul(float4(input.position, 1.0f), /*$(Variable:ViewProjMtx)*/);
    ret.wPos = input.position;
    ret.normal = input.normal;
    ret.tangent = input.tangent;
    ret.materialID = input.materialID;
    ret.texCoord0 = input.texCoord0;
    ret.color = float4(1.f, .25f, .75f, 1.f);
    
	// TODO: fill this out
	return ret;
}