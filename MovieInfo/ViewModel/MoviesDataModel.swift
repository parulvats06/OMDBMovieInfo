//
//  MoviesDataModel.swift
//  MovieInfo
//
//  Created by parul vats on 23/01/2018.
//  Copyright © 2018 parul vats. All rights reserved.
//

import UIKit

// Using the MVVM architecture , this class describes the view model for Movies
// this is created to separate the responsiblity of manipulating the data in the view that needs to displayed
class MoviesDataModel: NSObject {
    var data: Movies?
    
    /* function to call the getmovies API using the network service*/
    func getMovies(text: String, completion: @escaping () -> Void) {
        Service.sharedInstance.getMoviesById(searchText: text,onSuccess: { [weak self] (movies) in
            DispatchQueue.main.async {
                self?.data = movies
                completion()
            }
        }) { (error) in
            NSLog("Recieved error: \(error) while getting movies")
        }
    }
    
    /* returns the number of movies for the text entered by the user */
    func numberOfMovies() -> Int {
        return data?.movies.count ?? 0
    }
    
    /* returns the movie title */
    func movieTitle(for indexPath: IndexPath) -> String {
        return data?.movies[indexPath.row].title ?? ""
    }
    
    /* returns the movie poster */
    func moviePoster(for indexPath: IndexPath) -> String {
        return data?.movies[indexPath.row].poster ?? ""
    }
    
    /* returns the movie imdb id */
    func getIMDBId(for indexPath: IndexPath) -> String {
        return data?.movies[indexPath.row].imdbID ?? ""
    }
}
