//
//  TopRatedCollectionViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 18.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class TopRatedCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var topImgView: UIImageView!
    @IBOutlet weak var topRatedTitleLabel: UILabel!
    
    var topRatedMovieData: TopRatedelements!{
        didSet{
            let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(topRatedMovieData.backdropPath ?? "")")
            topImgView.kf.setImage(with: imgUrl)
            topRatedTitleLabel.text = topRatedMovieData.title
            
        }
    }
    
}
