//
//  ApplyFilterViewModifier.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 26.1.2024.
//

import SwiftUI
import FilterEngine

struct ApplyFilterViewModifier: ImageModifier {
    let filter: Filter
    let uiImage: UIImage
    
    @MainActor func body(image: Image) -> some View {
            // Apply your modifications specific to Image
        if filter.texture != nil {
            return AnyView(image.applyFilter(filter))
        }
        return AnyView(image)
    }
}

extension Image {
    func filterImage(_ filter: Filter, to uiImage: UIImage) -> some View {
        return modifier(ApplyFilterViewModifier(filter: filter, uiImage: uiImage))
    }
}
