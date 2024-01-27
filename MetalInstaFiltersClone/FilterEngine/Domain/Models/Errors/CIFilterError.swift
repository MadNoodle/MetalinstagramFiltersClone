//
//  CIFilterError.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 26.1.2024.
//

import Foundation

enum CIFilterError: Error {
    case invalidOutputImage
    case CGImageGenerationError
    case invalidInputImage
    case invalidLUTConversion
    case invalidFilter
    case badResizing
    case invalidDevice
    case invalidLUT
    
    var description: String {
        return "An error occured while processin your image."
    }
}
