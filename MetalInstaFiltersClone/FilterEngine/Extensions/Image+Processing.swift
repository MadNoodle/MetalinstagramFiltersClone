//
//  Image+Processing.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 26.1.2024.
//

import SwiftUI

public extension Image {
    /// Apply a custom filter to the view using a shader.
    ///
    /// - Parameters:
    ///   - filter: The filter to apply. It should be of type `Filter`.
    /// - Returns: A modified view with the specified filter applied.
    ///
    /// This method takes a `Filter` object and applies it to the current view using a
    /// shader. The shader function is obtained from the specified filter's fragment property. I
    /// t expects the filter to have a texture, and if it doesn't, the method will fatalError with
    /// a message indicating that an LUT (Lookup Table) filter must be initialized using the `applyLUTFilter` method.
    ///
    /// - Note: Make sure the filter is properly configured before calling this
    ///  method, and ensure that it has a valid texture property.
    ///
    /// Example usage:
    /// ```swift
    /// let myFilter = Filter(fragment: "customFragmentShader", texture: someTexture)
    /// someView.applyFilter(myFilter)
    /// ```
    ///
    /// - Warning: Ensure that the filter has a valid texture property, or this method will fatalError.
    ///
    /// - SeeAlso: `applyLUTFilter`
    func applyFilter(_ filter: Filter) -> some View {
        
        let shaderFunction = ShaderFunction(library: .default, name: filter.fragment)
        var shader = Shader(function: shaderFunction, arguments: [])
        
        if let texture = filter.texture {
            shader = Shader(function: shaderFunction, arguments: [Shader.Argument.image(Image(uiImage: texture))])
            return AnyView(self.colorEffect(shader, isEnabled: true))
        }
        
        return AnyView(self)
    }
}
