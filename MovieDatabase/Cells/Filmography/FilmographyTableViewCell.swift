//
//  FilmographyTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 2.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class FilmographyTableViewCell: UITableViewCell, ReusableView, NibLoadableView  {
    
    @IBOutlet weak var filmographyCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
    }
    
    func setDelegates() {
        filmographyCollectionView.delegate = self
        filmographyCollectionView.dataSource = self
        filmographyCollectionView.register(FilmographyCollectionViewCell.self)
    }
    
}
    
extension FilmographyTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FilmographyCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width / 2.5, height: height)
    }
    
}
