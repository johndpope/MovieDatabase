//
//  UpComingTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 5.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

//MARK: - Delegates
protocol UpComingTableViewCellDelegate {
    func didUpComingSelected(id: Int)
}

class UpComingTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    var counter = 0
    var timer = Timer()
    var delegate: UpComingTableViewCellDelegate!
    var viewController: ViewController!
    var upComingData: MovieModel!{
        didSet {
            upComingCollectionView.reloadData()
        }
    }
    
    @IBOutlet weak var upComingCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        
    }
    
    func setDelegates() {
        upComingCollectionView.delegate = self
        upComingCollectionView.dataSource = self
        upComingCollectionView.register(UpComingCollectionViewCell.self)
    }
    
    //Timer Function
    @objc func changeImage(){
        if(counter < upComingData.results.count) {
            let index = IndexPath.init(item: counter, section: 0)
            self.upComingCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter += 1
        }
        else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.upComingCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension UpComingTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if upComingData != nil {
            return upComingData.results.count
        }
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:  UpComingCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.fillUpComingMovie(upComingResponse: upComingData.results[indexPath.row])
        cell.upComingResponse = upComingData.results[indexPath.row]
        cell.delegate = self
        //cell.viewController = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width, height: height)
    }
    
}

//MARK: - Collection View Cell Delegate
extension UpComingTableViewCell: UpComingCollectionViewCellDelegate {
    func didPlayButtonTapped(id: Int) {
        self.delegate.didUpComingSelected(id: id)
    }
    
    
}
