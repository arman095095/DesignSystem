//
//  File.swift
//  
//
//  Created by Арман Чархчян on 06.05.2022.
//

import UIKit

public class ImageView: UIImageView {
    
    private var currentUrlString: String?
    
    public func set(imageURL: String?, placeholder: UIImage? = nil, completion: @escaping (UIImage?) -> () = { _ in }) {
        self.currentUrlString = imageURL
        guard let imageURL = imageURL,
              let url = URL(string: imageURL) else {
            self.image = nil
            return
        }
        self.image = placeholder
        handle(url: url, completion: completion)
    }
    
    public func set(imageURL: URL?, placeholder: UIImage? = nil, completion: @escaping (UIImage?) -> () = { _ in }) {
        self.currentUrlString = imageURL?.absoluteString
        guard let url = imageURL else {
            self.image = nil
            return
        }
        self.image = placeholder
        handle(url: url, completion: completion)
        
    }
    
    private func handle(url: URL, completion: @escaping (UIImage?) -> ()) {
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            let image = UIImage(data: cachedResponse.data)
            self.image = image
            completion(image)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.handleLoadedImage(data: data, response: response, completion: completion)
                }
            }
        }
        dataTask.resume()
    }
    
    private func handleLoadedImage(data: Data,
                                   response: URLResponse,
                                   completion: @escaping (UIImage?) -> ()) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
        if responseURL.absoluteString == currentUrlString {
            let image = UIImage(data: data)
            self.image = image
            completion(image)
        }
    }
}
