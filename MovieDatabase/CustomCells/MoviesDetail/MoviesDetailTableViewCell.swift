//
//  MoviesDetailTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 10.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class MoviesDetailTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func fillDetailMovie(moviesResponse: MoviesDetailModel) {
        let url = RequestManager.imageBaseUrl500 + moviesResponse.backdropPath
        movieImageView.setImageUrl(imageUrl: url)
        titleLabel.text = moviesResponse.title
        descriptionLabel.text = moviesResponse.description
        voteLabel.text = "\(moviesResponse.voteAverage ?? 0)"
        releaseDateLabel.text = moviesResponse.releaseDate
    }
    
}
