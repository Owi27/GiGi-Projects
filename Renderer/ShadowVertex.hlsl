// Unnamed technique, shader ShadowVertex
/*$(ShaderResources)*/

/*$(Embed:CamMath.hlsl)*/

struct VSInput
{
    float3 position : POSITION;
    uint vertexID : SV_VertexID;
	//TODO: fill this out
};

struct VSOutput // AKA PSInput
{
    float4 position : SV_POSITION;
	//TODO: fill this out
    float3 wPos : TEXCOORD0;
};

VSOutput main(VSInput input)
{
    VSOutput ret = (VSOutput) 0;
	// TODO: fill this out
    matrix shadowProj = Perspective(radians(90), 1.f, .1f, PLights[0].Range);
    matrix view = (matrix) 0;
    if (FACE == 0) //right
        view = LookAt(PLights[0].Pos, PLights[0].Pos + float3(1.f, 0.f, 0.f), float3(0.f, 1.f, 0.f));
    else if (FACE == 1) //left
        view = LookAt(PLights[0].Pos, PLights[0].Pos + float3(-1.f, 0.f, 0.f), float3(0.f, 1.f, 0.f));
    else if (FACE == 2) //top
        view = LookAt(PLights[0].Pos, PLights[0].Pos + float3(0.f, 1.f, 0.f), float3(0.f, 0.f, -1.f));
    else if (FACE == 3) //bottom
        view = LookAt(PLights[0].Pos, PLights[0].Pos + float3(0.f, -1.f, 0.f), float3(0.f, 0.f, 1.f));
    else if (FACE == 4) //front
        view = LookAt(PLights[0].Pos, PLights[0].Pos + float3(0.f, 0.f, 1.f), float3(0.f, 1.f, 0.f));
    else //back
        view = LookAt(PLights[0].Pos, PLights[0].Pos + float3(0.f, 0.f, -1.f), float3(0.f, 1.f, 0.f));
    
    
    

    ret.position = mul(float4(input.position, 1.f), mul(view, shadowProj));
    ret.wPos = input.position;
    return ret;
}
