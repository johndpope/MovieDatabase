//
//  SimilarTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 14.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit


//MARK: - Delegate
protocol SimilarTableViewCellDelegate {
    func didSimilarSelected(id: Int)
}

class SimilarTableViewCell: UITableViewCell, ReusableView, NibLoadableView{
    
    var delegate: SimilarTableViewCellDelegate!
    var similarData: SimilarModel! {
        didSet {
            similarCollectionView.reloadData()
        }
    }
    
    @IBOutlet weak var similarCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
    }
    
    private func setDelegates(){
        similarCollectionView.dataSource = self
        similarCollectionView.delegate = self
        similarCollectionView.register(SimilarCollectionViewCell.self)
    }
    
}

extension SimilarTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return similarData?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SimilarCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.fillSimilarMovie(similarResponse: similarData.results[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didSimilarSelected(id: (similarData?.results[indexPath.row].id)!)
    }
    
}
