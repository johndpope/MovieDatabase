//
//  NowTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 21.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

//MARK: - Delegates
protocol NowTableViewCellDelegate {
    func didSeeAllNowSelected()
    func didNowMovieSelected(id: Int, name: String)
}

class NowTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    var delegate: NowTableViewCellDelegate!
    var nowData: MovieModel!{
        didSet{
            nowCollecttionView.reloadData()
        }
    }
    
    @IBOutlet weak var nowCollecttionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
        
    }
    
    func setDelegates(){
        nowCollecttionView.delegate = self
        nowCollecttionView.dataSource = self
        nowCollecttionView.register(NowCollectionViewCell.self)
    }
    
    @IBAction func seeAllButtonTapped(_ sender: Any) {
        self.delegate.didSeeAllNowSelected()
    }
    
}

extension NowTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nowData?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NowCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.fillNowMovie(movieResponse: nowData.results[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate.didNowMovieSelected(id: nowData.results[indexPath.row].id, name: nowData.results[indexPath.row].title)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width / 2.5, height: height)
    }
    
}
