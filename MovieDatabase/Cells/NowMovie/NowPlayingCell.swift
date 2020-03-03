//
//  NowPlayingCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 11.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
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
    
}
