//
//  vertex_shader.metal
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//

#include <metal_stdlib>

using namespace metal;

struct VertexInput {
    float4 position [[attribute(0)]];
    float2 texCoordinate [[attribute(1)]];
};

struct VertexOutput {
    float4 position [[position]];
    float2 texCoordinate;
};

vertex VertexOutput vertex_main(const VertexInput vertexIn [[stage_in]],
                                constant float4x4& u_MVPMatrix [[buffer(0)]]) {
    VertexOutput vertexOut;
    
    // Pass through the texture coordinate.
    vertexOut.texCoordinate = vertexIn.texCoordinate;
    
    // Multiply the vertex by the matrix to get the final point in normalized screen coordinates.
    vertexOut.position = u_MVPMatrix * vertexIn.position;
    
    return vertexOut;
}


