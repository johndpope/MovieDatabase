//
//  TrendingPeopleTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 2.10.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class TrendingPeopleTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    @IBOutlet weak var peopleCollectionView: UICollectionView!
    
    var trendPersonData: TrendPersonModel! {
        didSet{
            peopleCollectionView.reloadData()
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
        peopleCollectionView.delegate = self
        peopleCollectionView.dataSource = self
        peopleCollectionView.register(TrendingPeopleCollectionViewCell.self)
    }
    
}

extension TrendingPeopleTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendPersonData?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TrendingPeopleCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.fillTrendPerson(trendPersonResponse: trendPersonData.results[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width / 2.5, height: height - 20)
    }
    
}
