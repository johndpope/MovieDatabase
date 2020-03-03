//
//  SimilarCollectionViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 14.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class SimilarCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var similarImgView: UIImageView!
    @IBOutlet weak var similarTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        similarImgView.layer.cornerRadius = 5
        
    }
    
    //MARK: - Fill Cell
    func fillSimilarMovie(similarResponse: SimilarResponse) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(similarResponse.posterPath ?? "")")
        similarImgView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        similarTitleLabel.text = similarResponse.title
    }
    
}
