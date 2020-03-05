//
//  FilmographyCollectionViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 2.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class FilmographyCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var filmographyContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayer()
    }
    
    //MARK: - Fill Filmography Movie Cell
    func fillFilmography(filmographyResponse: FilmographyElements) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(filmographyResponse.posterPath ?? "")")
        imageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        nameLabel.text = filmographyResponse.title
        
    }
    
    func setLayer() {
        filmographyContainerView.layer.cornerRadius = 5
    }

}
