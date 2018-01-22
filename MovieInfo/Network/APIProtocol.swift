//
//  APIProtocol.swift
//  MovieInfo
//
//  Created by  Parul Vats on 1/22/18.
//  Copyright © 2018  Parul Vats. All rights reserved.
//

// This class defines the protocal for API service

import Foundation

let baseURL: String = "https://www.omdbapi.com/"

typealias SearchMoviesCallback = (Movies) -> Void
typealias GetMovieDetailCallback = (MovieDetail) -> Void
typealias ErrorCallback = (NSError) -> Void

protocol APIProtocol {
     func getMoviesById(searchText: String, onSuccess: SearchMoviesCallback?, onError: ErrorCallback?)
     func getMovieDetailById(imdbId: String, onSuccess: GetMovieDetailCallback?, onError: ErrorCallback?)
}
