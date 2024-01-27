//
//  utils.metal
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//
#ifndef UTILS_METAL
#define UTILS_METAL
#include <metal_stdlib>
using namespace metal;

struct Utils {
    // MARK: - Blenders
    static half3 overlayBlender(half3 base, half3 overlay, half opacity)
    {
        // Overlay blending formula with opacity
        return mix(base, mix(2.0 * base * overlay, 1.0 - 2.0 * (1.0 - base) * (1.0 - overlay), step(0.5, overlay)), opacity);
    }
    
    static half3 multiplyBlender(half3 Color, half3 filter)
    {
        half3 filter_result;
        float luminance = dot(filter, half3(0.2125, 0.7154, 0.0721));
        
        if (luminance < 0.5)
            filter_result = 2.0 * filter * Color;
        else
            filter_result = Color;
        
        return filter_result;
    }
    
    // MARK: - Color Control
    static half3 brightnessContrastSaturation(half3 color, float brt, float con, float sat)
    {
        half3 black = half3(0.0, 0.0, 0.0);
        half3 middle = half3(0.5, 0.5, 0.5);
        float luminance = dot(color, half3(0.2125, 0.7154, 0.0721));
        half3 gray = half3(luminance, luminance, luminance);
        
        half3 brtColor = mix(black, color, brt);
        half3 conColor = mix(middle, brtColor, con);
        half3 satColor = mix(gray, conColor, sat);
        return satColor;
    }
    
//    half3 blendMode( int mode, half3 base, half3 blend ){
//        if( mode == 1 ){
//            return blendAdd( base, blend );
//        }else
//        if( mode == 2 ){
//            return blendAverage( base, blend );
//        }else
//        if( mode == 3 ){
//            return blendColorBurn( base, blend );
//        }else
//        if( mode == 4 ){
//            return blendColorDodge( base, blend );
//        }else
//        if( mode == 5 ){
//            return blendDarken( base, blend );
//        }else
//        if( mode == 6 ){
//            return blendDifference( base, blend );
//        }else
//        if( mode == 7 ){
//            return blendExclusion( base, blend );
//        }else
//        if( mode == 8 ){
//            return blendGlow( base, blend );
//        }else
//        if( mode == 9 ){
//            return blendHardLight( base, blend );
//        }else
//        if( mode == 10 ){
//            return blendHardMix( base, blend );
//        }else
//        if( mode == 11 ){
//            return blendLighten( base, blend );
//        }else
//        if( mode == 12 ){
//            return blendLinearBurn( base, blend );
//        }else
//        if( mode == 13 ){
//            return blendLinearDodge( base, blend );
//        }else
//        if( mode == 14 ){
//            return blendLinearLight( base, blend );
//        }else
//        if( mode == 15 ){
//            return blendMultiply( base, blend );
//        }else
//        if( mode == 16 ){
//            return blendNegation( base, blend );
//        }else
//        if( mode == 17 ){
//            return blendNormal( base, blend );
//        }else
//        if( mode == 18 ){
//            return blendOverlay( base, blend );
//        }else
//        if( mode == 19 ){
//            return blendPhoenix( base, blend );
//        }else
//        if( mode == 20 ){
//            return blendPinLight( base, blend );
//        }else
//        if( mode == 21 ){
//            return blendReflect( base, blend );
//        }else
//        if( mode == 22 ){
//            return blendScreen( base, blend );
//        }else
//        if( mode == 23 ){
//            return blendSoftLight( base, blend );
//        }else
//        if( mode == 24 ){
//            return blendSubtract( base, blend );
//        }else
//        if( mode == 25 ){
//            return blendVividLight( base, blend );
//        }
//    }
//
//    half3 blendMode( int mode, half3 base, half3 blend, float opacity ){
//        if( mode == 1 ){
//            return blendAdd( base, blend, opacity );
//        }else
//        if( mode == 2 ){
//            return blendAverage( base, blend, opacity );
//        }else
//        if( mode == 3 ){
//            return blendColorBurn( base, blend, opacity );
//        }else
//        if( mode == 4 ){
//            return blendColorDodge( base, blend, opacity );
//        }else
//        if( mode == 5 ){
//            return blendDarken( base, blend, opacity );
//        }else
//        if( mode == 6 ){
//            return blendDifference( base, blend, opacity );
//        }else
//        if( mode == 7 ){
//            return blendExclusion( base, blend, opacity );
//        }else
//        if( mode == 8 ){
//            return blendGlow( base, blend, opacity );
//        }else
//        if( mode == 9 ){
//            return blendHardLight( base, blend, opacity );
//        }else
//        if( mode == 10 ){
//            return blendHardMix( base, blend, opacity );
//        }else
//        if( mode == 11 ){
//            return blendLighten( base, blend, opacity );
//        }else
//        if( mode == 12 ){
//            return blendLinearBurn( base, blend, opacity );
//        }else
//        if( mode == 13 ){
//            return blendLinearDodge( base, blend, opacity );
//        }else
//        if( mode == 14 ){
//            return blendLinearLight( base, blend, opacity );
//        }else
//        if( mode == 15 ){
//            return blendMultiply( base, blend, opacity );
//        }else
//        if( mode == 16 ){
//            return blendNegation( base, blend, opacity );
//        }else
//        if( mode == 17 ){
//            return blendNormal( base, blend, opacity );
//        }else
//        if( mode == 18 ){
//            return blendOverlay( base, blend, opacity );
//        }else
//        if( mode == 19 ){
//            return blendPhoenix( base, blend, opacity );
//        }else
//        if( mode == 20 ){
//            return blendPinLight( base, blend, opacity );
//        }else
//        if( mode == 21 ){
//            return blendReflect( base, blend, opacity );
//        }else
//        if( mode == 22 ){
//            return blendScreen( base, blend, opacity );
//        }else
//        if( mode == 23 ){
//            return blendSoftLight( base, blend, opacity );
//        }else
//        if( mode == 24 ){
//            return blendSubtract( base, blend, opacity );
//        }else
//        if( mode == 25 ){
//            return blendVividLight( base, blend, opacity );
//        }
//    }
};
#endif // UTILS_METAL

