//
//  TypesCollectionViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 3.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class TypesCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    var genreData: GenreModel?
    
    @IBOutlet weak var typesContainerView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var genreNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayers()
    }
    
    func setLayers() {
        typesContainerView.layer.cornerRadius = 5
        firstView.layer.cornerRadius = 5
        secondView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
    }
    
    //MARK: - Fill Genre Cell
    func fillGenre(genreResponse: GenreElement) {
        genreNameLabel.text = genreResponse.name
        
//        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(movieResponse.posterPath ?? "")")
//        nowPosterImage.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
//        nowTitleLabel.text = movieResponse.title
//        nowVoteAverage.text = "\(movieResponse.voteAverage ?? 0)"
//        nowReleaseDate.text = movieResponse.releaseDate
//        movie = movieResponse
        
    }

}
