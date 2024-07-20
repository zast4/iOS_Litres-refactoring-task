import SwiftUI
import Combine

final class ImageLoader: ObservableObject {
    
    @Published
    var image: UIImage?
    
    @Published 
    var isLoading = false
    
    private var cancellable: AnyCancellable?
    
    func load(from url: URL?) {
        guard let url else {
            return
        }
        
        isLoading = true
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map {
                UIImage(data: $0.data)
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
                self.isLoading = false
            }, receiveValue: { image in
                self.image = image
            })
    }
}

