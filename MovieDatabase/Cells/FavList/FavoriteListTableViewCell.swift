//
//  FavoriteListTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 1.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class FavoriteListTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    var favMovie: [ListElements] = []
    
    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    @IBOutlet weak var lineView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
        lineView.layer.cornerRadius = 3
    }
    
    func setDelegates() {
        favoriteCollectionView.delegate = self
        favoriteCollectionView.dataSource = self
        favoriteCollectionView.register(FavoriteListCollectionViewCell.self)
    }
    
    func getFavMovie(favMovie: ListModel) {
        self.favMovie = favMovie.results
        self.favoriteCollectionView.reloadData()
    }
    
}

extension FavoriteListTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favMovie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FavoriteListCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.fillFavoriteList(favoriteListResponse: favMovie[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width / 2.6, height: height)
    }
    
}
