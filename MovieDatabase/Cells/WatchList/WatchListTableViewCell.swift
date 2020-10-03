//
//  WatchListTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 2.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class WatchListTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    var watchList: [ListElements] = []

    @IBOutlet weak var watchListCollectionView: UICollectionView!
    @IBOutlet weak var lineView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
        lineView.layer.cornerRadius = 3
    }
    
    func setDelegates() {
        watchListCollectionView.delegate = self
        watchListCollectionView.dataSource = self
        watchListCollectionView.register(WatchListCollectionViewCell.self)
    }
    
    func addWatchList(watchList: ListModel) {
        self.watchList = watchList.results
        self.watchListCollectionView.reloadData()
    }
    
}

extension WatchListTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return watchList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: WatchListCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.fillWatchList(watchListResponse: watchList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width / 2.6, height: height)
    }
    
}
