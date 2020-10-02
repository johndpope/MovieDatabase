//
//  TrendingMovieCollectionViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 2.10.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class TrendingMovieCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var tvSeriesContainerView: UIView!
    @IBOutlet weak var tvSeriesImageView: UIImageView!
    @IBOutlet weak var tvSeriesNameLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
    }
    
}
