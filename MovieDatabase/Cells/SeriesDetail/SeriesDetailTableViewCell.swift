//
//  SeriesDetailTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 10.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class SeriesDetailTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var seriesImgView: UIImageView!
    @IBOutlet weak var seriesTitleLabel: UILabel!
    @IBOutlet weak var seriesDescriptionLabel: UILabel!
    @IBOutlet weak var seriesVoteLabel: UILabel!
    @IBOutlet weak var seriesReleaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //MARK: - Fill Tv Series Cell
    
    func fillSeriesMovie(seriesResponse: SeriesDetailModel) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(seriesResponse.backdropPath ?? "")")
        seriesImgView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        seriesTitleLabel.text = seriesResponse.title
        seriesDescriptionLabel.text = seriesResponse.description
        seriesVoteLabel.text = "\(seriesResponse.voteAverage ?? 0)"
        seriesReleaseDate.text = seriesResponse.relaeseDate
        
    }
    
}
