// Unnamed technique, shader RendererFragment
/*$(ShaderResources)*/

/*$(Embed:Material.hlsl)*/

#define PI 3.14159265359

struct PSInput // AKA VSOutput
{
    float4 position : SV_POSITION;
    float3 wPos : POSITION;
	//TODO: fill this out
    float4 color : COLOR;
    float3 normal : NORMAL;
    float4 tangent : TANGENT;
    float2 texCoord0 : TEXCOORD0;
    int materialID : TEXCOORD1;
};

struct PSOutput
{
    float4 colorTarget : SV_Target0;
	//TODO: fill this out
    float4 colorTarget1 : SV_Target1;
    float4 colorTarget2 : SV_Target2;
    float4 colorTarget3 : SV_Target3;
    float4 colorTarget4 : SV_Target4;
};

/*            "name": "Material",
            "fields": [
                {
                    "name": "BaseColor",
                    "type": "Float4",
                    "semantic": "Material_BaseColor"
                },
                {
                    "name": "Emissive",
                    "type": "Float3",
                    "semantic": "Material_Emissive"
                },
                {
                    "name": "Metallic",
                    "type": "Float",
                    "semantic": "Material_Metallic"
                },
                {
                    "name": "Roughness",
                    "type": "Float",
                    "semantic": "Material_Roughness"
                },
                {
                    "name": "AlphaMode",
                    "type": "Int",
                    "semantic": "Material_AlphaMode"
                },
                {
                    "name": "AlphaCutoff",
                    "type": "Float",
                    "semantic": "Material_AlphaCutoff"
                },
                {
                    "name": "DoubleSided",
                    "type": "Int",
                    "semantic": "Material_DoubleSided"
                }
            ]

"name": "Light",
            "fields": [
                {
                    "name": "PosDir",
                    "type": "Float4",
                    "semantic": "Light_PosDir"
                },
                {
                    "name": "ColorIntensity",
                    "type": "Float4",
                    "semantic": "Light_ColorIntensity"
                },
                {
                    "name": "Range",
                    "type": "Float",
                    "semantic": "Light_Range"
                },
                {
                    "name": "SpotInnerOuterRad",
                    "type": "Float2",
                    "semantic": "Light_SpotInnerOuterRad"
                }
            ]
*/

float3 FresnelSchlick(float cosTheta, float3 F0)
{
    return F0 + (1.f - F0) * pow(clamp(1.0 - cosTheta, 0.f, 1.f), 5.f);
}

float DistributionGGX(float3 N, float3 H, float roughness)
{
    float a = roughness * roughness;
    float a2 = a * a;
    float NdotH = max(dot(N, H), 0.f);
    float NdotH2 = NdotH * NdotH;
	
    float num = a2;
    float denom = (NdotH2 * (a2 - 1.f) + 1.f);
    denom = PI * denom * denom;
	
    return num / denom;
}

float GeometrySchlickGGX(float NdotV, float roughness)
{
    float r = (roughness + 1.0);
    float k = (r * r) / 8.0;

    float num = NdotV;
    float denom = NdotV * (1.0 - k) + k;
	
    return num / denom;
}

float GeometrySmith(float3 N, float3 V, float3 L, float roughness)
{
    float NdotV = max(dot(N, V), 0.0);
    float NdotL = max(dot(N, L), 0.0);
    float ggx2 = GeometrySchlickGGX(NdotV, roughness);
    float ggx1 = GeometrySchlickGGX(NdotL, roughness);
	
    return ggx1 * ggx2;
}

float2 OctWrap(float2 v)
{
    return (1.0 - abs(v.yx)) * select(v.xy >= 0.0, 1.0, -1.0);
}

float2 Encode(float3 n)
{
    n /= (abs(n.x) + abs(n.y) + abs(n.z));
    n.xy = n.z >= 0.0 ? n.xy : OctWrap(n.xy);
    n.xy = n.xy * 0.5 + 0.5;
    return n.xy;
}

PSOutput main(PSInput input)
{
    PSOutput ret = (PSOutput) 0;
    
    float3 nrm;
    float occ;
  Struct_Material m = Material_Material(Materials, input.materialID, input.texCoord0, input.texCoord0, input.texCoord0, input.texCoord0, nrm, occ); //when using structs it's Struct_*
	// TODO: fill this out
    float3 T = normalize(input.tangent.xyz);
    float3 N = normalize(input.normal);
    T = normalize(T - dot(T, N) * N); // Gram-Schmidt
    float3 B = cross(N, T) * input.tangent.w; // handedness
    float3x3 TBN = float3x3(T, B, N);
    
    float3 worldNormal = normalize(mul(nrm, TBN));
    
    ret.colorTarget = float4(m.BaseColor.rgb, 1.f); //float4(color, 1.f); //float4(m.BaseColor.rgb, 1.f); //float4((input.normal + 1.f) * .5f, 1.f);
    ret.colorTarget1 = float4(worldNormal * .5f + .5f, 1.f); //0-1
    ret.colorTarget2 = float4(occ, m.Roughness, m.Metallic, input.materialID);
    ret.colorTarget3 = float4(m.Emissive, 1.f);
    ret.colorTarget4 = float4(1.f, 1.f, 1.f, 1.f);
    return ret;
}

/*
Shader Resources:
	Buffer Materials (as SRV)
	Buffer Lights (as SRV)
*/
