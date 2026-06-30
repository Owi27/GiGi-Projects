// Unnamed technique, shader PointLightShadow
/*$(ShaderResources)*/

/*$(Embed:CamMath.hlsl)*/

float CalculatePointLightDepth(float3 pWorldPos, float3 pLightPos, float pFar)
{
    float distanceToLight = length(pWorldPos - pLightPos);
    return saturate(distanceToLight / pFar);
}

/*$(_compute:main)*/(uint3 DTid : SV_DispatchThreadID)
{
matrix shadowProj = Perspective(radians(90), 1.f, .1f, 1000.f);
matrix right = LookAt(PointLight.Pos, PointLight.Pos + float3(1.f, 0.f, 0.f), float3(0.f, -1.f, 0.f));
matrix left = LookAt(PointLight.Pos, PointLight.Pos + float3(-1.f, 0.f, 0.f), float3(0.f, -1.f, 0.f));
matrix top = LookAt(PointLight.Pos, PointLight.Pos + float3(0.f, 1.f, 0.f), float3(0.f, 0.f, 1.f));
matrix bottom = LookAt(PointLight.Pos, PointLight.Pos + float3(0.f, -1.f, 0.f), float3(0.f, 0.f, -1.f));
matrix front = LookAt(PointLight.Pos, PointLight.Pos + float3(0.f, 0.f, 1.f), float3(0.f, -1.f, 0.f));
matrix back = LookAt(PointLight.Pos, PointLight.Pos + float3(0.f, 0.f, -1.f), float3(0.f, -1.f, 0.f));
}

/*
Shader Resources:
    Buffer PointLight (as SRV)
	Texture ShadowCubeMap (as UAV)
*/
