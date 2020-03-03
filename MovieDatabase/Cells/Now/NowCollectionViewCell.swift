//
//  NowCollectionViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 21.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit
import Kingfisher

class NowCollectionViewCell: UICollectionViewCell, ReusableView, NibLoadableView {
    
    var movie: NowMovieResponse!
    
    @IBOutlet weak var nowContainerView: UIView!
    @IBOutlet weak var nowPosterImage: UIImageView!
    @IBOutlet weak var nowTitleLabel: UILabel!
    @IBOutlet weak var nowReleaseDate: UILabel!
    @IBOutlet weak var nowVoteAverage: UILabel!
    @IBOutlet weak var nowAddButton: UIButton!
    @IBOutlet weak var nowLikeButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nowContainerView.layer.cornerRadius = 10
    }
    
    //MARK: - Fill Now Movie Cell
    func fillNowMovie(movieResponse: NowMovieResponse) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(movieResponse.posterPath ?? "")")
        nowPosterImage.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        nowTitleLabel.text = movieResponse.title
        nowVoteAverage.text = "\(movieResponse.voteAverage ?? 0)"
        nowReleaseDate.text = movieResponse.releaseDate
        movie = movieResponse
        
    }
    
    //MARK - Add Items to Favorite List.
    func addFavoriteList() {
        AddFavoriteRequest.init(id: Account.current.user.id, sessionId: Account.current.session.sessionId, mediaId: movie.id, favorite: true).request(success: { (object) in
            print("***********************\(object.status_message ?? "")********************")
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    //MARK - Add Items to Watch List.
    func addWatchList() {
        AddWatchListRequest.init(id: Account.current.user.id, sessionId: Account.current.session.sessionId, mediaId: movie.id, watchlist: true).request(success: { (object) in
            print("***********************\(object.status_message ?? "")********************")
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    //MARK: - Action Buttons
    @IBAction func nowLikeButtonTapped(_ sender: Any) {
        addFavoriteList()
        NotificationCenter.default.post(name: Notification.Name("Liked"), object: nil, userInfo: nil)
    }

    @IBAction func nowAddButtonTapped(_ sender: Any) {
        addWatchList()
        NotificationCenter.default.post(name: Notification.Name("Added"), object: nil, userInfo: nil)
    }
}
