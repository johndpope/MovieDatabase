//
//  LatestMovieCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 11.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class LatestMovieCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var latestMovieImage: UIImageView!
    @IBOutlet weak var latestPosterImage: UIImageView!
    @IBOutlet weak var latestTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
