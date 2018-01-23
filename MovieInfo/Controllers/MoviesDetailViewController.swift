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
    @IBOutlet weak var detailTableView: UITableView!
    
    var imdbId: String = ""
    var movieTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = movieTitle
        initializeTableView()
        // Do any additional setup after loading the view.
        movieDetailModel.getMovieDetail(imdbId: imdbId) { [weak self] in
            self?.detailTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func initializeTableView() {
        let dataNib = UINib(nibName: Constants.nibIdentifiers.movieDataTableViewCell, bundle: nil)
        detailTableView.register(dataNib, forCellReuseIdentifier: Constants.cellIdentifiers.movieDataCellIdentifier)
        
        let posterNib = UINib(nibName: Constants.nibIdentifiers.moviePosterTableViewCell, bundle: nil)
        detailTableView.register(posterNib, forCellReuseIdentifier: Constants.cellIdentifiers.moviePosterCellIdentifier)
        
        detailTableView.dataSource = self
        detailTableView.delegate = self
        detailTableView.rowHeight = UITableViewAutomaticDimension
        
        detailTableView.estimatedRowHeight = UITableViewAutomaticDimension
    }
}

/* Extend  MoviesViewController to conform to tableview protocol for showing the users*/
extension MoviesDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDetailModel.contentCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifiers.movieDataCellIdentifier, for: indexPath)
            if let cell = cell as? MovieDataTableViewCell {
                cell.movieInfoLabel.text = movieDetailModel.movieInfoLabel(for: indexPath)
                cell.movieInfoText.text = movieDetailModel.movieInfoText(for: indexPath)
                cell.movieInfoText.translatesAutoresizingMaskIntoConstraints = false
                cell.movieInfoText.numberOfLines = 0;
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifiers.moviePosterCellIdentifier, for: indexPath)
            if let cell = cell as? MoviePosterTableViewCell {
                cell.moviePosterImageView.loadImageAsync(with: movieDetailModel.data?.poster)
            }
            return cell
        }
    }
}
