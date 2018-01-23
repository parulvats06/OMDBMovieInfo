//
//  MovieDetailModel.swift
//  MovieInfo
//
//  Created by parul vats on 23/01/2018.
//  Copyright © 2018 parul vats. All rights reserved.
//

import UIKit

class MovieDetailModel: NSObject {
    var data: MovieDetail?
    
    /* function to call the getmovies API using the network service*/
    func getMovieDetail(imdbId: String, completion: @escaping () -> Void) {
        Service.sharedInstance.getMovieDetailById(imdbId: imdbId, onSuccess: { [weak self] (movieDetail) in
            DispatchQueue.main.async {
                self?.data = movieDetail
                completion()
            }
        }) { (error) in
            NSLog("Recieved error: \(error) while getting movie details")
        }
    }
}
