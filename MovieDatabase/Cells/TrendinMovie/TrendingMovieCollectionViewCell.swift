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
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //MARK: - Fill Trend Movie Cell
    
    func fillTrendMovie(trendPersonResponse: TrendMovieElements) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(trendPersonResponse.backdropPath ?? "")")
        movieImageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        movieNameLabel.text = trendPersonResponse.title
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
    }
    
}
