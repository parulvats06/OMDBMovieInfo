//
//  Movies.swift
//  MovieInfo
//
//  Created by parul vats on 22/01/2018.
//  Copyright © 2018 parul vats. All rights reserved.
//

import UIKit
import SwiftyJSON

// Using the MVVM architecture , this class describes the view model for Movies
// this is created to separate the responsiblity of manipulating the data in the view that needs to displayed
struct Movie {
    var title: String
    var year: Int
    var imdbID: String
    var type: String
    var poster: String
    
    init(json: JSON) {
        title = json["Title"].stringValue
        year = json["Year"].intValue
        imdbID = json["imdbID"].stringValue
        type = json["Type"].stringValue
        poster = json["Poster"].stringValue
    }
}

struct Movies {
    var movies: [Movie]
    
    init(json: JSON) {
        movies = [Movie]()
        let dataJson = json["Search"].arrayValue
        for subJson in dataJson {
            let movie = Movie(json: subJson)
            movies.append(movie)
        }
    }
}
