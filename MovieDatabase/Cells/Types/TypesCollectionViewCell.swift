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
    
    
    @IBOutlet weak var firstImgView: UIImageView!
    @IBOutlet weak var secondImgView: UIImageView!
    @IBOutlet weak var thirdImgView: UIImageView!
    
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
        firstImgView.image = UIImage(named: "\(genreResponse.id)" + "-1")
        secondImgView.image = UIImage(named: "\(genreResponse.id)" + "-2")
        thirdImgView.image = UIImage(named: "\(genreResponse.id)" + "-3")
        
    }

}
