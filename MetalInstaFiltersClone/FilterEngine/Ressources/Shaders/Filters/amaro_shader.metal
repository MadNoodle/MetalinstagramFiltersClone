//
//  amaro_shader.metal
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//
#include <metal_stdlib>

#ifndef UTILS_METAL
#include "utils.metal"
#endif
using namespace metal;

[[ stitchable ]] half4 amaro_kernel_main(
                                           float2 position, half4 currentColor,
                                           texture2d<half> tex
)
{
    half3 irgb = currentColor.rgb;
    constexpr sampler textureSampler (mag_filter::linear,
                                      min_filter::linear);
    half3 filter = tex.sample(textureSampler, position).rgb;

    // Adjust the brightness/contrast/saturation
    half3 bcs_result = Utils().brightnessContrastSaturation(irgb, 1.1, 1.1, 1.1);

    // Add blue
    half3 blue_result = half3(bcs_result.r, bcs_result.g * 1.03, bcs_result.b);

    // Add filter (overlay blending)
    half3 after_filter = mix(blue_result, Utils().overlayBlender(blue_result, filter, 0.2), 0.6);

    return half4(after_filter.rgb, 1.0);
}


