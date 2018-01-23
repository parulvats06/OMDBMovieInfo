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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       
    @IBAction func touchUpInsideSearchButtonPressed(_ sender: Any) {
        self.presentSearchResults()
    }
    
    fileprivate func presentSearchResults() {
        if let moviesVC = self.storyboard?.instantiateViewController(withIdentifier: "MoviesVC") as? MoviesViewController {
            self.navigationController?.pushViewController(moviesVC, animated: true)
        }
    }
    
}
