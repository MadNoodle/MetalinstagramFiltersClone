//
//  ImageModifier.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 26.1.2024.
//

import Foundation
import SwiftUI

protocol ImageModifier {
    /// `Body` is derived from `View`
    associatedtype Body: View

    /// Modify an image by applying any modifications into `some View`
    func body(image: Image) -> Self.Body
}

extension Image {
    func modifier<M>(_ modifier: M) -> some View where M: ImageModifier {
        modifier.body(image: self)
    }
}
