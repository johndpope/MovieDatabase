//
//  UpComingCollectionViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 5.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

protocol UpComingCollectionViewCellDelegate {
    func didPlayButtonTapped(id: Int)
}

class UpComingCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    var upComingResponse: MovieElements!
    var delegate: UpComingCollectionViewCellDelegate!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    //MARK: - Fill UpComing Movie Cell
    func fillUpComingMovie(upComingResponse: MovieElements) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(upComingResponse.backdropPath ?? "")")
        let posterUrl = URL(string: "https://image.tmdb.org/t/p/w500\(upComingResponse.posterPath ?? "")")
        imageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        posterImageView.kf.setImage(with: posterUrl, placeholder: UIImage(named: "default"))
        nameLabel.text = upComingResponse.title
    }
    
    @IBAction func playButtonTabbed(_ sender: Any) {
        delegate.didPlayButtonTapped(id: upComingResponse.id)
    }
    
}
