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
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayer()
        
    }
    
    //MARK: - Fill Watch List
    func fillWatchList(watchListResponse: ListElements) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(watchListResponse.posterPath ?? "")")
        watchListImageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        watchListNameLabel.text = watchListResponse.title
        voteLabel.text = "\(watchListResponse.voteAverage ?? 0)"
        releaseDateLabel.text = watchListResponse.releaseDate
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        
    }
    
    func setLayer() {
        watchContainerView.layer.cornerRadius = 5
        deleteButton.layer.borderWidth = 1
        deleteButton.layer.borderColor = UIColor.darkGray.cgColor
        deleteButton.layer.cornerRadius = 5
    }
    
}

let date = Date()
let formate = date.getFormattedDate(format: "MMMM yyyy") // Set output formate

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
