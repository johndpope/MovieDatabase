//
//  CastCollectionViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 20.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    var castProfileData: CastElements!{
        didSet {
            let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(castProfileData?.profilePath ?? "")")
            profileImgView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
            profileTitleLabel.text = castProfileData?.name
        }
    }
    
    @IBOutlet weak var profileImgView: CircleImageView!
    @IBOutlet weak var profileTitleLabel: UILabel!
    
    override func awakeFromNib(){
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}
