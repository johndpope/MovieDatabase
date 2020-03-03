//
//  TvSeriesCollectionViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 28.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class TvSeriesCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    
    @IBOutlet weak var tvSeriesImageView: UIImageView!
    @IBOutlet weak var tvSeriesNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tvSeriesImageView.layer.cornerRadius = 5
    }
    
    //MARK: - Fill Tv Series Cell
    func fillTvSeries(tvSeriesResponse: TvSeriesResponse) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(tvSeriesResponse.backdropPath ?? "")")
        tvSeriesImageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        tvSeriesNameLabel.text = tvSeriesResponse.name
        //movie = movieResponse
    }

}
