//
//  FilterSelector.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//

import SwiftUI
import FilterEngine

struct FilterSelector: View {
    let filter: Filter
    
    var body: some View {
        VStack {
            Image(uiImage: Assets.Main.newYork.image)
                .resizable()
                .applyFilter(filter)
                .scaledToFill()
                .frame(width: .size(.large), height: .size(.large))
                .clipShape(
                    RoundedRectangle(cornerRadius: .radius(.xSmall))
                )
            Text(filter.title)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    FilterSelector(filter: .amaro)
}
