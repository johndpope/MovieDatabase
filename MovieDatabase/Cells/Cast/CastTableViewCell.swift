//
//  CastTableViewCell.swift
//  MovieDatabase
//
//  Created by ilkay sever on 20.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

//MARK: - Delegate
protocol CastTableViewCellDelegate {
    func didCastSelected(id: Int, castName: String)
}

class CastTableViewCell: UITableViewCell,ReusableView, NibLoadableView {
    
    var delegate: CastTableViewCellDelegate!
    var castData: CastModel!{
        didSet{
            castCollectionView.reloadData()
        }
    }
    
    @IBOutlet weak var castCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegates()
    }

    func setDelegates(){
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        castCollectionView.register(CastCollectionViewCell.self)
    }
    
}

extension CastTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castData.cast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CastCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.castProfileData = castData.cast[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let data = castData.cast[indexPath.row]
        let screenWidth = UIScreen.main.bounds.width
        return CGSize(width: screenWidth / 3, height: (screenWidth / 3) + data.name.height(width: screenWidth / 3) + 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate.didCastSelected(id: castData.cast[indexPath.row].personId, castName: castData.cast[indexPath.row].name)
    }
    
}

extension String {
    func height(width: CGFloat) -> CGFloat {
        let abc = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: abc, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)], context: nil)
        return ceil(boundingBox.height)
    }
}
