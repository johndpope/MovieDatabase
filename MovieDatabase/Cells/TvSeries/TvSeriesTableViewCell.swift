//
//  TvSeriesTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 28.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

//MARK: -Delegates
protocol TvSeriesTableViewCellDelegate {
    func didSeeAllSeriesSelected()
}

class TvSeriesTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    var delegate: TvSeriesTableViewCellDelegate!
    var tvSeriesData: SeriesModel!{
        didSet{
            tvSeriesCollectionView.reloadData()
        }
    }
    
    @IBOutlet weak var tvSeriesCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
    }


    func setDelegates() {
        tvSeriesCollectionView.dataSource = self
        tvSeriesCollectionView.delegate = self
        tvSeriesCollectionView.register(TvSeriesCollectionViewCell.self)
    }
    
    @IBAction func seeAllSeriesButtonTapped(_ sender: Any) {
        self.delegate.didSeeAllSeriesSelected()
    }
    
}

extension TvSeriesTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvSeriesData.results.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TvSeriesCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.fillTvSeries(tvSeriesResponse: tvSeriesData.results[indexPath.row])
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.delegate.didNowMovieSelected(id: nowData.results[indexPath.row].id)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width / 1.3, height: height / 1.1)
    }
    
}
