//
//  MetalError.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//

import Foundation

enum MetalError: Error {
    case invalidImageConversion
    case invalidImageGeneration
    
    var description: String {
        switch self {
        case .invalidImageConversion: return "Invalid conversion from CIImage to MTLTexture"
        case .invalidImageGeneration: return "Invalid conversion from ciImage to cgImage"
        }
    }
}
