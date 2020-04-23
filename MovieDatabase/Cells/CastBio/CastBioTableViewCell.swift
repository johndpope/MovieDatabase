//
//  CastBioTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 23.04.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit
import Kingfisher

class CastBioTableViewCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var actProfileImgView: UIImageView!
    @IBOutlet weak var actNameLabel: UILabel!
    @IBOutlet weak var actBirthday: UILabel!
    @IBOutlet weak var actBirthLocationLabel: UILabel!
    @IBOutlet weak var actGenderImageView: UIImageView!
    @IBOutlet weak var actBioTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        actProfileImgView.layer.cornerRadius = 5
    }
    
    func fillActBio(actBioResponse: ActElements) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(actBioResponse.profilePath ?? "")")
        actProfileImgView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        actNameLabel.text = actBioResponse.name
        actBirthday.text = actBioResponse.birthday
        actBirthLocationLabel.text = actBioResponse.placeOfBirth
        
        
        //actBioTextView.text = actBioResponse.biography
        switch actBioResponse.gender! {
        case .male:
            actGenderImageView.image = UIImage(named: "male")
        case .female:
            actGenderImageView.image = UIImage(named: "female")
        }
    }
}
