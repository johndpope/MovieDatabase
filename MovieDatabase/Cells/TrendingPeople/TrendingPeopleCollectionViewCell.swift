//
//  TrendingPeopleCollectionViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 2.10.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class TrendingPeopleCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var peopleContainerView: UIView!
    @IBOutlet weak var peopleImageView: UIImageView!
    @IBOutlet weak var peopleNameLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setViews()
        
    }
    
    private func setViews() {
        peopleContainerView.layer.cornerRadius = 8
        
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
    }
    

}
