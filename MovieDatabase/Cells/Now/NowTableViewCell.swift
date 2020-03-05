//
//  NowTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 21.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

//MARK: - Delegates
protocol NowTableViewCellDelegate {
    func didPaginate()
    func didSelected(id: Int)
}

class NowTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    var page: Int!
    var totalPage:Int!
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
        self.delegate.didSelected(id: nowData.results[indexPath.row].id)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == nowData.results.count - 1 && page < totalPage {
            self.delegate.didPaginate()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width / 2.5, height: height)
    }

    
}
