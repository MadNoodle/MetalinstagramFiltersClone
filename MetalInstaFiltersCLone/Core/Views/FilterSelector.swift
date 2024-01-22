//
//  FilterSelector.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//

import SwiftUI

struct FilterSelector: View {
    let filter: Filter
    
    var body: some View {
        VStack {
            Image("new york")
                .resizable()
                .scaledToFill()
                .frame(width: 64, height: 64)
                .clipShape(RoundedRectangle(cornerRadius: 2))
            Text(filter.title)
                .font(.caption)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    FilterSelector(filter: .amaro)
}
