
#include <metal_stdlib>

#ifndef UTILS_METAL
#include "utils.metal"
#endif
using namespace metal;


[[stitchable]] half4 willow_kernel_main(float2 position, half4 currentColor,
                                        texture2d<half> tex
                                        )
{
    const float3 W = float3(0.2125, 0.7154, 0.0721);
    half3 irgb = currentColor.rgb;
    
    half luminance = dot(float3(irgb), W);
    half3 gray = half3(luminance, luminance, luminance);
    half3 result = Utils().brightnessContrastSaturation(gray, 2.5, 1.1, 1.0);
    
    return half4(result, 1.0);
}
