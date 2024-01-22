//
//  FilterPicker.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//

import SwiftUI

struct FilterPicker: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                Spacer(minLength: 8)
                ForEach(Filter.allCases, id: \.self) { filter in
                    FilterSelector(filter: filter)
                        .onTapGesture {
                            print("\(filter.title) tapped")
                        }
                }
                .padding(.vertical, 12)
            }
        }
    }
}
