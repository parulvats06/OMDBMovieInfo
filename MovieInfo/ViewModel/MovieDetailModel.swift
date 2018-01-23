//
//  MovieDetailModel.swift
//  MovieInfo
//
//  Created by parul vats on 23/01/2018.
//  Copyright © 2018 parul vats. All rights reserved.
//

import UIKit

// Using the MVVM architecture , this class describes the view model for Movie detail
// this is created to separate the responsiblity of manipulating the data in the view that needs to displayed
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
    
    func contentCount() -> Int {
        return 7
    }
    
    /* returns the label based on table row */
    func movieInfoLabel(for indexPath: IndexPath) -> String {
        var label = ""
        switch indexPath.row {
        case 1  :
            label = "Cast"
        case 2  :
            label = "Director"
        case 3  :
            label = "IMDB Rating"
        case 4  :
            label = "Language"
        case 5  :
            label = "Year"
        case 6  :
            label = "Plot"
        default : break
        }
        return label
    }
    
    /* returns the info text based on table row */
    func movieInfoText(for indexPath: IndexPath) -> String {
        var text = ""
        switch indexPath.row {
        case 1  :
            if let cast = data?.cast {
                text = cast
            }
        case 2  :
            if let director = data?.director {
                text = director
            }
        case 3  :
            if let rating = data?.imdbRating {
                text = String(rating)
            }
        case 4  :
            if let language = data?.language {
                text = language
            }
        case 5  :
            if let year = data?.year {
                text = String(year)
            }
        case 6  :
            if let plot = data?.description {
                text = plot
            }
        default : break
        }
        return text
    }
}
