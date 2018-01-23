//
//  MovieDataTableViewCell.swift
//  MovieInfo
//
//  Created by parul vats on 23/01/2018.
//  Copyright © 2018 parul vats. All rights reserved.
//

import UIKit

class MovieDataTableViewCell: UITableViewCell {

    @IBOutlet weak var movieInfoLabel: UILabel!
    @IBOutlet weak var movieInfoText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
