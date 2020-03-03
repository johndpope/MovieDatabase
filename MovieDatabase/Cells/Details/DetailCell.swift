//
//  DetailCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 14.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell, ReusableView, NibLoadableView{
    
    @IBOutlet weak var detailsImgView: UIImageView!
    @IBOutlet weak var detailsTitleLabel: UILabel!
    @IBOutlet weak var detailsDescLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func fillDetailMovie(detailResponse: DetailModel) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(detailResponse.backdropPath ?? "")")
        detailsImgView.kf.setImage(with: imgUrl)
        detailsTitleLabel.text = detailResponse.title
        detailsDescLabel.text = detailResponse.description
        voteLabel.text = "\(detailResponse.voteAverage ?? 0)"
        releaseDateLabel.text = detailResponse.releaseDate
    }
    
}

