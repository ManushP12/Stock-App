//
//  ImageLoader.swift
//  TestApp
//
//  Created by Manush Patel on 2023-04-09.
//

import Combine
import UIKit

final class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private(set) var isLoading = false
    
    private let url: URL
    private var cache: ImageCache?
    private var cancellable: AnyCancellable?
    
    private static let imageProcessingQueue = DispatchQueue(label: "com.devtechie.imageProcessing")
    
    init(url: URL, cache: ImageCache? = nil) {
        self.url = url
        self.cache = cache
        
    }
    
    deinit {
        cancel ()
    }
    
    func load() {
        guard !isLoading else {
            return
        }
        
        if let image = cache?[url] {
            self.image = image
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map {UIImage(data: $0.data)}
            .replaceError(with: nil)
            .handleEvents(
                receiveSubscription: {[weak self] _ in self?.onStart()},
                receiveOutput: {[weak self] in self?.cache($0) },
                receiveCompletion: {[weak self] _ in self?.onFinish()},
                receiveCancel: {[weak self]in self?.onFinish()})
            .subscribe(on: Self.imageProcessingQueue)
            .receive(on: DispatchQueue.main)
            .sink{[weak self] in self?.image = $0}
    }
    
    func onStart() {
        isLoading = true
    }
    
    func onFinish() {
        isLoading = false
    }
    
    private func cache(_ image: UIImage? ){
        image.map {cache?[url] = $0}
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
