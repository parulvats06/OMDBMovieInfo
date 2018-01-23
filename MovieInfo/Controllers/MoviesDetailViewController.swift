//
//  MoviesDetailViewController.swift
//  MovieInfo
//
//  Created by parul vats on 22/01/2018.
//  Copyright © 2018 parul vats. All rights reserved.
//

import UIKit

class MoviesDetailViewController: UIViewController {
    @IBOutlet var movieDetailModel: MovieDetailModel!
    
    var imdbId: String = ""
    var movieTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = movieTitle
        // Do any additional setup after loading the view.
        movieDetailModel.getMovieDetail(imdbId: imdbId) { [weak self] in
            self?.loadContent()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func loadContent() {
        print(movieDetailModel)
        loadPoster()
    }
    
    fileprivate func loadPoster() {
        // Image loading.
    }

}
