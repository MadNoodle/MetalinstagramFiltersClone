import SwiftUI
import FilterEngine

struct PhotoFxView: View {
    @State private var currentFilter: Filter = .none
    @State private var image = Assets.Main.newYork.image
    private var original = Assets.Main.newYork.image

    var body: some View {
        VStack(spacing: .spacing(.medium)) {
            Spacer()

            viewer                
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .padding(.horizontal)

            Text("@copyright https://unsplash.com/@onevagabond")
                .font(.caption)
                .foregroundStyle(.white)

            Spacer()

            FilterPicker(for: self.image) { filter in
                // Ensure that the ImageProcessor is set up before applying the filter

                // Update the currentFilter state
                currentFilter = filter
            }
            .background(
                Color(.white)
                    .opacity(0.1)
            )
            .ignoresSafeArea()
        }
        
        .background(.black)
        .onChange(of: currentFilter) { _, newValue in
            guard currentFilter == newValue else { return }
            if currentFilter.lut != nil {
                image.applyLUTFilter(currentFilter) { result in
                    guard let filtered = result else { return }
                    image = filtered
                }
            }
        }
        
    }
    
    @ViewBuilder 
    private var viewer: some View {
        if currentFilter.texture != nil {
            Image(uiImage: original)
                .resizable()
                .filterImage(self.currentFilter)
        } else if currentFilter.lut != nil {
            Image(uiImage: image)
                .resizable()
        } else {
            Image(uiImage: original)
                .resizable()
        }
    }
}

struct PhotoFxView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoFxView()
    }
}
