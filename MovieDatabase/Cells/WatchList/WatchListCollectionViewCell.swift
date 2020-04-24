//
//  WatchListCollectionViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 2.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class WatchListCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    var watchListData: ListModel?
    
    @IBOutlet weak var watchListImageView: UIImageView!
    @IBOutlet weak var watchListNameLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var watchContainerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayer()
        
    }
    
    //MARK: - Fill Watch List
    func fillWatchList(watchListResponse: ListElements) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(watchListResponse.backdropPath ?? "")")
        watchListImageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        watchListNameLabel.text = watchListResponse.title
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        
    }
    
    func setLayer() {
        watchContainerView.layer.cornerRadius = 5
    }
    
}
