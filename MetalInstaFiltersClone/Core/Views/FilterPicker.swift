//
//  FilterPicker.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//

import SwiftUI
import FilterEngine

struct FilterPicker: View {
    // MARK: - Properties
    private var onFilterSelected: ((Filter) -> Void)?
    private let image: UIImage
    
    // MARK: - Init
    init(
        for image: UIImage,
        onFilterSelected: ((Filter) -> Void)? = nil
    ) {
        self.image = image
        self.onFilterSelected = onFilterSelected
    }

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: .spacing(.large)) {
                Spacer(minLength: .spacing(.small))
                ForEach(Filter.allCases, id: \.self) { filter in
                    FilterSelector(filter: filter)
                        .onTapGesture {
                            print(filter)
                            // Send the selected filter back to the parent view
                            onFilterSelected?(filter)
                            
                        }
                }
                .padding(.vertical, .spacing(.medium))
            }
        }
    }
}
