//
//  TrendingTvTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 2.10.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class TrendingTvTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var trendTvCollectionVieew: UICollectionView!
    
    var trendTvData: TrendTvModel! {
        didSet{
            trendTvCollectionVieew.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setDelegates() {
        trendTvCollectionVieew.delegate = self
        trendTvCollectionVieew.dataSource = self
        trendTvCollectionVieew.register(TrendingTvCollectionViewCell.self)
    }
    
}

extension TrendingTvTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendTvData.results.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TrendingTvCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.fillTrendTV(trendTvResponse: trendTvData.results[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width, height: height / 1.1)
    }
    
}


