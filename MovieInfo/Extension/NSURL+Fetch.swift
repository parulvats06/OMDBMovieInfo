//
//  NSURL+Fetch.swift
//  MovieInfo
//
//  Created by parul vats on 23/01/2018.
//  Copyright © 2018 parul vats. All rights reserved.
//

import UIKit

extension NSURL {
    typealias ImageCompletion = (UIImage) -> Void
    /// Fetches the image from the network.
    /// Only calls completion on successful image download.
    /// Completion is called on the main thread.
    func fetchImage(url: String, completion: @escaping ImageCompletion) {
        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                if let  data = data,let image = UIImage(data: data) {
                    DispatchQueue.main.async() {
                        completion(image)
                    }
                }
            }
        }
        task.resume()
    }
}
