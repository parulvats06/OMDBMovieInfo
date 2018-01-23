//
//  Movies.swift
//  MovieInfo
//
//  Created by parul vats on 22/01/2018.
//  Copyright © 2018 parul vats. All rights reserved.
//

import UIKit
import SwiftyJSON

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
        print (dataJson)
        for subJson in dataJson {
            let movie = Movie(json: subJson)
            movies.append(movie)
        }
    }
}
