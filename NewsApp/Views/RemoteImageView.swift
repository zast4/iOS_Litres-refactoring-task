import SwiftUI

struct RemoteImageView: View {
    
    @StateObject
    private var imageLoader = ImageLoader()
    
    let url: URL?
    let geometry: GeometryProxy
    
    var body: some View {
        VStack(spacing: 0) {
            if imageLoader.isLoading {
                PlaceholderView()
                    .frame(width: geometry.size.width * Constants.imageWidthCoef, height: geometry.size.width * Constants.imageWidthCoef)
            } else if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width * Constants.imageWidthCoef, height: geometry.size.width * Constants.imageWidthCoef)
                    .clipped()
                    .transition(.opacity)
            } else {
                Rectangle()
                    .foregroundStyle(.red)
                    .frame(width: geometry.size.width * Constants.imageWidthCoef, height: geometry.size.width * Constants.imageWidthCoef)
            }
        }
        .onAppear {
            imageLoader.load(from: url)
        }
    }
}
