//
//  MovieDetail.swift
//  MovieInfo
//
//  Created by parul vats on 22/01/2018.
//  Copyright © 2018 parul vats. All rights reserved.
//

import UIKit
import SwiftyJSON

struct MovieDetail {
    var title: String
    var year: Int
    var imdbID: String
    var type: String
    var poster: String
    var cast: String
    var director: String
    var imdbRating: Double
    var language: String
    var description: String
    
    init(json: JSON) {
        title = json["Title"].stringValue
        year = json["Year"].intValue
        imdbID = json["imdbID"].stringValue
        type = json["Type"].stringValue
        poster = json["Poster"].stringValue
        cast = json["Actors"].stringValue
        director = json["Director"].stringValue
        imdbRating = json["imdbRating"].doubleValue
        language = json["Language"].stringValue
        description = json["Plot"].stringValue
    }
}
