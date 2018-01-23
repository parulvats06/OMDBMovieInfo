//
//  MoviesViewController.swift
//  MovieInfo
//
//  Created by parul vats on 22/01/2018.
//  Copyright © 2018 parul vats. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet var moviesDataModel: MoviesDataModel!
    var searchText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Movies"
        print(searchText)
        super.viewDidLoad()
        initializeTableView()
        loadMovies()
    }
    
    fileprivate func initializeTableView() {
        let nib = UINib(nibName: Constants.nibIdentifiers.moviesTableViewCell, bundle: nil)
        movieTableView.register(nib, forCellReuseIdentifier: Constants.cellIdentifiers.moviesViewCellIdentifier)
        movieTableView.dataSource = self
        movieTableView.delegate = self
    }
    
    fileprivate func loadMovies() {
        moviesDataModel.getMovies(text: searchText) { [weak self] in
            self?.movieTableView.reloadData()
        }
    }
    
    fileprivate func showDetails() {
        let detailsVC = MoviesDetailViewController()
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

/* Extend  MoviesViewController to conform to tableview protocol for showing the users*/
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesDataModel.numberOfMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifiers.moviesViewCellIdentifier, for: indexPath)
        
        if let cell = cell as? MovieTableViewCell {
            cell.movieTitle.text = moviesDataModel.movieTitle(for: indexPath)
            // Image loading.
            cell.posterImageView.loadImageAsync(with: moviesDataModel.moviePoster(for: indexPath))
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let movieDetailVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.storyboardId.movieDetailVC) as? MoviesDetailViewController {
            movieDetailVC.imdbId = moviesDataModel.getIMDBId(for: indexPath)
            movieDetailVC.movieTitle = moviesDataModel.movieTitle(for: indexPath)
            self.navigationController?.pushViewController(movieDetailVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}
