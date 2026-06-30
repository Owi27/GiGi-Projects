Struct_Material Material_Material(StructuredBuffer<Struct_Material> MaterialsBuffer, int materialID, float2 uv0, float2 uv1, float2 uv2, float2 uv3, out float3 normal, out float occlusion,
    float2 uv0ddx = float2(0.0f, 0.0f), float2 uv0ddy = float2(0.0f, 0.0f), float2 uv1ddx = float2(0.0f, 0.0f), float2 uv1ddy = float2(0.0f, 0.0f),
    float2 uv2ddx = float2(0.0f, 0.0f), float2 uv2ddy = float2(0.0f, 0.0f), float2 uv3ddx = float2(0.0f, 0.0f), float2 uv3ddy = float2(0.0f, 0.0f))
{
    Struct_Material ret = (Struct_Material)0;
    ret.BaseColor = float4(0.f, 0.f, 0.f, 0.f);
    ret.Emissive = float3(0.f, 0.f, 0.f);
    ret.Metallic = float(0.f);
    ret.Roughness = float(0.f);
    ret.AlphaMode = int(0);
    ret.AlphaCutoff = float(0.f);
    ret.DoubleSided = int(0);

    normal = float3(0.0f, 0.0f, 1.0f);
    occlusion = 1.0f;

    float normalScale = 1.0f;
    float occlusionStrength = 1.0f;

    uint materialCount, materialStride;
    MaterialsBuffer.GetDimensions(materialCount, materialStride);

    if (materialID < 0 || materialID >= materialCount)
        return ret;

    // Read material data from the buffer
    ret = MaterialsBuffer[materialID];

    // Sample the textures
    switch(materialID)
    {
        case 0:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\5061699253647017043.png":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\11872827283454512094.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\11872827283454512094.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8773302468495022225.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 1:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7268504077753552595.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8503262930880235456.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8503262930880235456.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4477655471536070370.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 2:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\white.png":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            break;
        }

        case 3:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8006627369776289000.png":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\715093869573992647.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\715093869573992647.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\12501374198249454378.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 4:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8750083169368950601.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\16885566240357350108.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\16885566240357350108.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\13982482287905699490.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 5:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\5792855332885324923.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\11968150294050148237.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\11968150294050148237.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\16299174074766089871.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 6:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\14650633544276105767.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4871783166746854860.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4871783166746854860.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2051777328469649772.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 7:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\15295713303328085182.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\9916269861720640319.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\9916269861720640319.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\10388182081421875623.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 8:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\6047387724914829168.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8051790464816141987.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8051790464816141987.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\15722799267630235092.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 9:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\5823059166183034438.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\13824894030729245199.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\13824894030729245199.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\14267839433702832875.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 10:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7441062115984513793.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8114461559286000061.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8114461559286000061.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\6667038893015345571.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 11:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\11490520546946913238.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\3455394979645218238.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\3455394979645218238.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\3628158980083700836.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 12:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\6151467286084645207.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8783994986360286082.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8783994986360286082.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7645212358685992005.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 13:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4975155472559461469.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\3371964815757888145.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\3371964815757888145.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2299742237651021498.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 14:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4675343432951571524.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7815564343179553343.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7815564343179553343.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7056944414013900257.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 15:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2775690330959970771.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7815564343179553343.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7815564343179553343.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2374361008830720677.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 16:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2185409758123873465.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7815564343179553343.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7815564343179553343.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\332936164838540657.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 17:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\17876391417123941155.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\466164707995436622.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\466164707995436622.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\6593109234861095314.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 18:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\11474523244911310074.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\466164707995436622.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\466164707995436622.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4601176305987539675.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 19:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\9288698199695299068.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\466164707995436622.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\466164707995436622.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4910669866631290573.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 20:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\16275776544635328252.png":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\1219024358953944284.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\1219024358953944284.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\14170708867020035030.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 21:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\755318871556304029.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2411100444841994089.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2411100444841994089.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\3827035219084910048.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 22:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8481240838833932244.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\17556969131407844942.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\17556969131407844942.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\10381718147657362067.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 23:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\6772804448157695701.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\13196865903111448057.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\13196865903111448057.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\759203620573749278.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }

        case 24:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2969916736137545357.jpg":Any:float4:true:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8747919177698443163.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8747919177698443163.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\14118779221266351425.jpg":Any:float4:false:true)*/.SampleGrad(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, uv0ddx, uv0ddy).rgb * 2.0f - 1.0f;
            break;
        }
    }

    normal = normalize(normal * float3(normalScale, normalScale, 1.0f));
    ret.BaseColor.rgb = lerp(ret.BaseColor.rgb, ret.BaseColor.rgb * occlusion, occlusionStrength);

    return ret;
};

Struct_Material Material_Material_Level(StructuredBuffer<Struct_Material> MaterialsBuffer, int materialID, float2 uv0, float2 uv1, float2 uv2, float2 uv3, out float3 normal, out float occlusion,
    int level = 0)
{
    Struct_Material ret = (Struct_Material)0;
    ret.BaseColor = float4(0.f, 0.f, 0.f, 0.f);
    ret.Emissive = float3(0.f, 0.f, 0.f);
    ret.Metallic = float(0.f);
    ret.Roughness = float(0.f);
    ret.AlphaMode = int(0);
    ret.AlphaCutoff = float(0.f);
    ret.DoubleSided = int(0);

    normal = float3(0.0f, 0.0f, 1.0f);
    occlusion = 1.0f;

    float normalScale = 1.0f;
    float occlusionStrength = 1.0f;

    uint materialCount, materialStride;
    MaterialsBuffer.GetDimensions(materialCount, materialStride);

    if (materialID < 0 || materialID >= materialCount)
        return ret;

    // Read material data from the buffer
    ret = MaterialsBuffer[materialID];

    // Sample the textures
    switch(materialID)
    {
        case 0:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\5061699253647017043.png":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\11872827283454512094.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\11872827283454512094.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8773302468495022225.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 1:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7268504077753552595.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8503262930880235456.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8503262930880235456.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4477655471536070370.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 2:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\white.png":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            break;
        }

        case 3:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8006627369776289000.png":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\715093869573992647.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\715093869573992647.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\12501374198249454378.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 4:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8750083169368950601.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\16885566240357350108.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\16885566240357350108.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\13982482287905699490.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 5:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\5792855332885324923.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\11968150294050148237.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\11968150294050148237.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\16299174074766089871.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 6:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\14650633544276105767.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4871783166746854860.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4871783166746854860.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2051777328469649772.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 7:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\15295713303328085182.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\9916269861720640319.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\9916269861720640319.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\10388182081421875623.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 8:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\6047387724914829168.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8051790464816141987.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8051790464816141987.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\15722799267630235092.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 9:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\5823059166183034438.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\13824894030729245199.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\13824894030729245199.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\14267839433702832875.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 10:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7441062115984513793.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8114461559286000061.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8114461559286000061.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\6667038893015345571.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 11:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\11490520546946913238.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\3455394979645218238.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\3455394979645218238.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\3628158980083700836.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 12:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\6151467286084645207.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8783994986360286082.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8783994986360286082.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7645212358685992005.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 13:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4975155472559461469.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\3371964815757888145.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\3371964815757888145.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2299742237651021498.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 14:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4675343432951571524.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7815564343179553343.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7815564343179553343.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7056944414013900257.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 15:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2775690330959970771.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7815564343179553343.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7815564343179553343.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2374361008830720677.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 16:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2185409758123873465.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7815564343179553343.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\7815564343179553343.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\332936164838540657.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 17:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\17876391417123941155.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\466164707995436622.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\466164707995436622.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\6593109234861095314.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 18:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\11474523244911310074.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\466164707995436622.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\466164707995436622.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4601176305987539675.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 19:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\9288698199695299068.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\466164707995436622.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\466164707995436622.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\4910669866631290573.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 20:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\16275776544635328252.png":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\1219024358953944284.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\1219024358953944284.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\14170708867020035030.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 21:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\755318871556304029.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2411100444841994089.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2411100444841994089.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\3827035219084910048.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 22:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8481240838833932244.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\17556969131407844942.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\17556969131407844942.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\10381718147657362067.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 23:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\6772804448157695701.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\13196865903111448057.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\13196865903111448057.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\759203620573749278.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }

        case 24:
        {
            ret.BaseColor *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\2969916736137545357.jpg":Any:float4:true:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgba;
            ret.Metallic *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8747919177698443163.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).b;
            ret.Roughness *= /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\8747919177698443163.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).g;
            normal = /*$(Image2D:"..\..\glTF-Sample-Models-main\glTF-Sample-Models-main\2.0\Sponza\glTF\14118779221266351425.jpg":Any:float4:false:true)*/.SampleLevel(/*$(Sampler:linear:linear:linear:wrap)*/, uv0, level).rgb * 2.0f - 1.0f;
            break;
        }
    }

    normal = normalize(normal * float3(normalScale, normalScale, 1.0f));
    ret.BaseColor.rgb = lerp(ret.BaseColor.rgb, ret.BaseColor.rgb * occlusion, occlusionStrength);

    return ret;
};
