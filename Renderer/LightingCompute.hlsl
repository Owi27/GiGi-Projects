// Unnamed technique, shader LightingCompute
/*$(ShaderResources)*/

/*$(Embed:Lights.hlsl)*/

float3 ReconstructWorldPosition(float2 pUV, float pDepth)
{
	//screen uv to ndc
    float2 screenPos = pUV * 2.f - 1.f;
    screenPos.y = -screenPos.y;
    
	//ndc & depth -> viewSpace pos
	//view to world
    float4 world = mul(float4(screenPos, pDepth, 1.f), /*$(Variable:InvViewProjMtx)*/);
    world /= world.w;
	
    return world.xyz;
}

/*$(_compute:main)*/(uint3 DTid : SV_DispatchThreadID)
{
uint2 pixel = DTid.xy;

float2 uv = (float2(pixel) + .5f) / /*$(Variable:iResolution)*/.xy;

float3 position = ReconstructWorldPosition(uv, Depth[pixel]);

float occlusion = Material[pixel].r;
float roughness = Material[pixel].g;
float metallic = Material[pixel].b;

float3 N = normalize(Normal[pixel].rgb * 2.f - 1.f); //-1-1
float3 V = normalize( /*$(Variable:CameraPos)*/- position);

//direct lighting    
float3 lightPos = float3(lerp(-7.f, 7.f, abs(sin( /*$(Variable:iTime)*/ * .5f))), 0.f, 0.f);
float3 Lo = float3(0.f, 0.f, 0.f);
for (int i = 0;i < 5; i++)
    {        
        if (i < 4)
        {
            Lo += PointLight(position, N, V, PLights[i].Pos, PLights[i].Col, PLights[i].Range, Albedo[pixel].rgb, metallic, roughness);
        }
        if (i > 3)
        {
            Lo += PointLight(position, N, V, lightPos, /*$(Variable:LightCol)*/, 0, Albedo[pixel].rgb, metallic, roughness);
        }
    }

//Directional Light
Lo += DirectionalLight(N, V, float3(-.2f, -1.f, -.3f), float3(0.f, 0.f, 1.f), Albedo[pixel].rgb, metallic, roughness);
    
float3 ambient = float3(.0f, .0f, .0f) * Albedo[pixel].rgb * occlusion; 
float3 color = ambient + Lo;
    
    color = color / (color + float3(1.f, 1.f, 1.f));
    color = pow(color, float3(1.f / 2.2f, 1.f / 2.2f, 1.f / 2.2f));

    Output[pixel] = float4(color, 1.f);
}

/*
Shader Resources:
	Buffer Lights (as SRV)
	Buffer PLights (as SRV)
	Texture Albedo (as SRV)
	Texture Normal (as SRV)
	Texture Material (as SRV)
	Texture Emissive (as SRV)
	Texture Velocity (as SRV)
	Texture Depth (as SRV)
	Texture Output (as UAV)
*/
