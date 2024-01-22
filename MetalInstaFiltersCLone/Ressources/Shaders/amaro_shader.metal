//
//  amaro_shader.metal
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//
#include <metal_stdlib>

using namespace metal;

struct VertexInput {
    float4 position [[position]];
    float2 texCoordinate [[attribute(0)]];
};

struct FragmentInput {
    float2 texCoordinate;
};

struct Uniforms {
    texture2d<float, access::sample> u_Texture0;
    texture2d<float, access::sample> u_Texture1;
    float T_bright;
    float T_contrast;
    float T_saturation;
};

float3 brightnessContrastSaturation(float3 color, float brt, float con, float sat)
{
    float3 black = float3(0.0, 0.0, 0.0);
    float3 middle = float3(0.5, 0.5, 0.5);
    float luminance = dot(color, float3(0.2125, 0.7154, 0.0721));
    float3 gray = float3(luminance, luminance, luminance);
    
    float3 brtColor = mix(black, color, brt);
    float3 conColor = mix(middle, brtColor, con);
    float3 satColor = mix(gray, conColor, sat);
    return satColor;
}

float3 overlayBlender(float3 Color, float3 filter)
{
    float luminance = dot(filter, float3(0.2125, 0.7154, 0.0721));

    if (luminance < 0.5)
        return 2.0 * filter * Color;
    else
        return 1.0 - (1.0 - (2.0 * (filter - 0.5))) * (1.0 - Color);
}

fragment float4 fragment_main(VertexInput input [[stage_in]],
                              texture2d<float, access::sample> u_Texture0 [[texture(0)]],
                              texture2d<float, access::sample> u_Texture1 [[texture(1)]],
                              constant Uniforms& uniforms [[buffer(0)]])
{
    float3 irgb = u_Texture0.sample(sampler(coord::normalized, address::clamp_to_edge, filter::linear), input.texCoordinate).rgb;
    float3 filter = u_Texture1.sample(sampler(coord::normalized, address::clamp_to_edge, filter::linear), input.texCoordinate).rgb;

    // Adjust the brightness/contrast/saturation
    float3 bcs_result = brightnessContrastSaturation(irgb, uniforms.T_bright, uniforms.T_contrast, uniforms.T_saturation);

    // Add blue
    float3 blue_result = float3(bcs_result.r, bcs_result.g * 1.03, bcs_result.b);

    // Add filter (overlay blending)
    float3 after_filter = mix(blue_result, overlayBlender(blue_result, filter), 0.6);

    return float4(after_filter, 1.0);
}
