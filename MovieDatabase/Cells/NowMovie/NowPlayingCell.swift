//
//  NowPlayingCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 11.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class NowPlayingCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nowTittleLabel: UILabel!
    @IBOutlet weak var nowDescLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setLayers()
    }
    
    func setLayers(){
        imgView.layer.cornerRadius = 5
    }
    
    //MARK: - Fill Discover List
    func fillDiscoverList(discoverResponse: MovieElements) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(discoverResponse.posterPath ?? "")")
        imgView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        nowTittleLabel.text = discoverResponse.title
        nowDescLabel.text = discoverResponse.description
        releaseLabel.text = discoverResponse.releaseDate
    }
    
    func fillSeriesList(seriesResponse: SeriesElements) {
        let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(seriesResponse.posterPath ?? "")")
        imgView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
        nowTittleLabel.text = seriesResponse.title
        nowDescLabel.text = seriesResponse.description
        releaseLabel.text = seriesResponse.releaseDate
    }
    
}
