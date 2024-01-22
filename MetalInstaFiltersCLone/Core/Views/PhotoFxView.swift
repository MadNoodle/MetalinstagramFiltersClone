//
//  ContentView.swift
//  MetalInstaFiltersCLone
//
//  Created by User on 22.1.2024.
//

import SwiftUI

struct PhotoFxView: View {
    
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            Image("new york")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 300)
                .clipShape(Rectangle())
            
            Text("@copyright https://unsplash.com/@onevagabond")
                .font(.caption)
            Spacer()
            FilterPicker()
                .background(Color(.black).opacity(0.1))
                .ignoresSafeArea()
            
        }
    }
}

#Preview {
    PhotoFxView()
}
