//
//  TopRatedTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 18.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class TopRatedTableViewCell: UITableViewCell, ReusableView, NibLoadableView {
    
    var timer = Timer()
    var counter = 0
    var identifier: Int!
    var topRatedData: TopRatedModel! {
        didSet {
            pageControl.numberOfPages = topRatedData?.results.count ?? 0
            topRatedCollectionView.reloadData()
        }
    }
    
    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
        topRatedCollectionView.reloadData()
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setDelegates(){
        topRatedCollectionView.delegate = self
        topRatedCollectionView.dataSource = self
        topRatedCollectionView.register(TopRatedCollectionViewCell.self)
    }
    
    //Timer Function
    @objc func changeImage(){
        if(counter < topRatedData.results.count) {
            let index = IndexPath.init(item: counter, section: 0)
            self.topRatedCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter += 1
            //pageControl.currentPage += 1
        }
        else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.topRatedCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension TopRatedTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topRatedData?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TopRatedCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.topRatedMovieData = topRatedData?.results[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width) 
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.item
    }
    
}
