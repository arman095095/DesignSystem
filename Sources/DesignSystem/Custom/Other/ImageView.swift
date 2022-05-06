//
//  File.swift
//  
//
//  Created by Арман Чархчян on 06.05.2022.
//

import UIKit

public class ImageView: UIImageView {
    
    private var currentUrlString: String?
    
    public func set(imageURL: String?) {
        self.currentUrlString = imageURL
        guard let imageURL = imageURL,
              let url = URL(string: imageURL) else {
            self.image = nil
            return
        }
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cachedResponse.data)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.handleLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    public func set(imageURL: URL?) {
        self.currentUrlString = imageURL?.absoluteString
        guard let url = imageURL else {
            self.image = nil
            return
        }
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cachedResponse.data)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.handleLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    private func handleLoadedImage(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
        if responseURL.absoluteString == currentUrlString {
            self.image = UIImage(data: data)
        }
    }
}
