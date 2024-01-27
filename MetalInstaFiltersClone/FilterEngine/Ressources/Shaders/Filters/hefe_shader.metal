//
//  Hefe.metal
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//

#include <metal_stdlib>

#ifndef UTILS_METAL
#include "utils.metal"
#endif
using namespace metal;

[[stitchable]] half4 hefe_kernel_main(
                                float2 position, half4 currentColor,
                                texture2d<half> tex
                                   )
{
    half3 irgb = currentColor.rgb;
    constexpr sampler textureSampler (mag_filter::linear,
                                      min_filter::linear);
    half3 filter = tex.sample(textureSampler, position).rgb;

    // Adjust the brightness/contrast/saturation
    half3 bcs_result = Utils().brightnessContrastSaturation(irgb, 1.3, 1.0, 1.3);

    // More red, less blue
    half3 rb_result = half3(bcs_result.r * 1.15, bcs_result.g, bcs_result.b * 0.8);

    // Add filter (overlay blending)
    half3 after_filter = mix(rb_result, Utils().overlayBlender(rb_result, filter, 0.2), 0.8);

    return half4(after_filter, 1.0);
}
