//
//  SearchViewController.swift
//  MovieInfo
//
//  Created by parul vats on 22/01/2018.
//  Copyright © 2018 parul vats. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Do any additional setup after loading the view.
        //reset the text
        setupSearchButtonView()
        searchText?.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       
    @IBAction func touchUpInsideSearchButtonPressed(_ sender: Any) {
        self.presentSearchResults()
    }
    
    fileprivate func setupSearchButtonView() {
        searchButton.makeButtonRound(cornerRadius: searchButton.layer.frame.height / 2, borderWidth: 1, borderColor: .clear)
        searchButton.addShadow()
        searchButton.setTitleColor(.white, for: .normal)
    }
    
    fileprivate func presentSearchResults() {
        if let moviesVC = self.storyboard?.instantiateViewController(withIdentifier: Constants.storyboardId.moviesVC) as? MoviesViewController {
            guard let textToSearch = searchText?.text else {
                // throw error if invalid text or empty
                return
            }
            moviesVC.searchText = textToSearch
            self.navigationController?.pushViewController(moviesVC, animated: true)
        }
    }
    
}
