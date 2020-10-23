//
//  TrendingTvCollectionViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 2.10.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class TrendingTvCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var tvContainerView: UIView!
    @IBOutlet weak var tvImageView: UIImageView!
    @IBOutlet weak var tvNameLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Fill Trend Tv Cell
    
    func fillTrendTV(trendTvResponse: TrendTvElements) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(trendTvResponse.backdropPath ?? "")")
        tvImageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        tvNameLabel.text = trendTvResponse.name
    }

}
