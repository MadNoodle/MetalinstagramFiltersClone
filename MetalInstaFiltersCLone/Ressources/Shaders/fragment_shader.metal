//
//  fragment_shader.metal
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//

#include <metal_stdlib>

using namespace metal;

fragment float4 fragment_main(
    texture2d<float, access::sample> u_Texture [[ texture(0) ]],
    sampler u_TextureSampler [[ sampler(0) ]],
    float2 v_TexCoordinate [[ stage_in ]]
)
{
    constexpr sampler textureSampler(coord::normalized, filter::linear, address::clamp_to_edge);

    float4 color = u_Texture.sample(textureSampler, v_TexCoordinate);
    return color;
}
