//
//  original_shader.metal
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//

#include <CoreImage/CoreImage.h>

using namespace metal;

[[ stitchable ]] half4 original_kernel_main(
                                            float2 position,
                                            half4 currentColor,
                                            texture2d<half> tex
                                            ) {
    return currentColor;
}

