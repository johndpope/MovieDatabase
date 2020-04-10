//
//  TrailerTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 24.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit
import YouTubePlayer

class TrailerTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var trailerYouTubePlayer: YouTubePlayerView!
    
//    var urlString: String!
//    var trailerData: VideoModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        print("***************************\(trailerData!)************************")
//        youTube(playerView: trailerYouTubePlayer)
    }
    
//    func youTube(playerView: YouTubePlayerView) {
//        trailerYouTubePlayer.loadVideoID(urlString)
//        trailerYouTubePlayer.play()
//    }
    
}
