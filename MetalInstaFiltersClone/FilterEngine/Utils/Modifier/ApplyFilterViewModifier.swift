//
//  ApplyFilterViewModifier.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 26.1.2024.
//

import SwiftUI

struct ApplyFilterViewModifier: ImageModifier {
    let filter: Filter
    
    @MainActor func body(image: Image) -> some View {
            // Apply your modifications specific to Image
        if filter.texture != nil {
            return AnyView(image.applyFilter(filter))
        }
        return AnyView(image)
    }
}

public extension Image {
    func filterImage(_ filter: Filter) -> some View {
        return modifier(ApplyFilterViewModifier(filter: filter))
    }
}
