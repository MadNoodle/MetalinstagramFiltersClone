//
//  hudson_shader.metal
//  MetalInstaFiltersCLone
//
//  Created by User on 23.1.2024.
//
#include <metal_stdlib>

#ifndef UTILS_METAL
#include "utils.metal"
#endif
using namespace metal;


[[stitchable]] half4 hudson_kernel_main(
                                         float2 position, half4 currentColor,
                                         texture2d<half> tex
                                     )
{
    half3 irgb = currentColor.rgb;
    constexpr sampler textureSampler (mag_filter::linear,
                                      min_filter::linear);
    half3 filter = tex.sample(textureSampler, position).rgb;

    // Adjust the brightness/contrast/saturation
    half3 bcs_result = Utils().brightnessContrastSaturation(irgb, 1.2, 1.1, 0.9);

    // Add filter (overlay blending)
    half3 after_filter = mix(bcs_result, Utils().overlayBlender(bcs_result, filter, 0.2), 0.4);

    return half4(after_filter, 1.0);
}