//
//  VideoViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 12.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit
import YouTubePlayer

class VideoViewController: UIViewController {
    
    @IBOutlet weak var youtubePlayer: YouTubePlayerView!
    
    var urlString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("****************************\(urlString!)****************************")
        youTube(playerView: youtubePlayer)
        
    }
    
    func youTube(playerView: YouTubePlayerView) {
        youtubePlayer.loadVideoID(urlString)
        youtubePlayer.play()
    }
    
}
