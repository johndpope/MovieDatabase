//
//  FavoriteListCollectionViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 1.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class FavoriteListCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    var favData: ListModel?
    
    @IBOutlet weak var favoriteMovieImage: UIImageView!
    @IBOutlet weak var favoriteMovieNameLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var favContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayer()
        
    }
    
    //MARK: - Fill Favorite List
    
    func fillFavoriteList(favoriteListResponse: ListElements) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(favoriteListResponse.backdropPath ?? "")")
        favoriteMovieImage.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        favoriteMovieNameLabel.text = favoriteListResponse.title
    }
    
    func deleteFavorite() {
        
    }
    
    func setLayer() {
        favContainerView.layer.cornerRadius = 5
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        
    }
    
}
