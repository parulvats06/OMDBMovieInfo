//
//  Service.swift
//  MovieInfo
//
//  Created by Parul Vats on 1/22/18.
//  Copyright © 2018 Parul Vats. All rights reserved.
//

import Foundation
import SwiftyJSON

//This service is used for API calls. 

class Service: APIProtocol {
    static let sharedInstance = Service()
    
    func getMoviesById(searchText: String, onSuccess: SearchMoviesCallback?, onError: ErrorCallback?) {
        dataTask(urlRequest: "?s=" + searchText, method: "GET", parameters: nil, completion: { (success, data) in
            if success, let data = data as? Data{
                let json = JSON(data: data)
                onSuccess?(Movies(json: json))
            } else if let data = data as? NSError {
                onError?(data)
            }
        })
    }
    
    func getMovieDetailById(imdbId: String, onSuccess: GetMovieDetailCallback?, onError: ErrorCallback?) {
        dataTask(urlRequest: "?i=" + imdbId, method: "GET", parameters: nil, completion: { (success, data) in
            if success, let data = data as? Data{
                let json = JSON(data: data)
                onSuccess?(MovieDetail(json: json))
            } else if let data = data as? NSError {
                onError?(data)
            }
        })
    }
    
    
    private func dataTask(urlRequest: String, method: String, parameters: [String: String]?, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        // add the base string and api key
        guard let apiKey = Settings.sharedInstance.getAPIKey() else {
            return
        }
        
        let urlString = baseURL + urlRequest + "&apiKey=" + apiKey
        guard let url = URL(string: urlString) else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        if (parameters != nil) {
            let httpBody = try? JSONSerialization.data(withJSONObject: parameters ?? "", options: [])
            request.httpBody = httpBody
        }
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        session.dataTask(with: request) { (data, response, error) -> Void in
            if let data = data {
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    completion(true, data as AnyObject)
                } else {
                    completion(true, error as AnyObject)
                }
            }
        }.resume()
    }
}

