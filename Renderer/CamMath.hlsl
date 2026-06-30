matrix Perspective(float pFoV, float pAspect, float pZNear, float pZFar)
{
    const float tanHalfFoV = tan(pFoV / 2.f);
    
    matrix output = matrix(
    float4(1.f / (pAspect * tanHalfFoV), 0, 0, 0),
    float4(0, 1.f / tanHalfFoV, 0, 0),
    float4(0, 0, pZFar / (pZFar - pZNear), 1.f),
    float4(0, 0, -(pZFar * pZNear) / (pZFar - pZNear), 0));
    
    return output;
}

matrix LookAt(float3 pEye, float3 pAt, float3 pUp)
{
    const float3 forward = normalize(pAt - pEye);
    const float3 right = normalize(cross(pUp, forward));
    const float3 up = cross(forward, right);

    return matrix(
        float4(right.x, up.x, forward.x, 0.0f),
        float4(right.y, up.y, forward.y, 0.0f),
        float4(right.z, up.z, forward.z, 0.0f),
        float4(-dot(right, pEye), -dot(up, pEye), -dot(forward, pEye), 1.0f));
}