//
//  TypesViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 3.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class TypesViewController: UIViewController {
    
    var genreData: GenreModel?
    
    @IBOutlet weak var typesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        genreRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide NavigationBar in this viewController.
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show NavigationBar other viewController.
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func genreRequest() {
        GenreRequest.init().request(success: {(object) in
            self.genreData = object
            self.typesCollectionView.reloadData()
        }) {(error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func setDelegates() {
        typesCollectionView.delegate = self
        typesCollectionView.dataSource = self
        typesCollectionView.register(TypesCollectionViewCell.self)
    }
    
}

extension TypesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genreData?.genres.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TypesCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.fillGenre(genreResponse: (genreData?.genres[indexPath.row])!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let id = genreData?.genres[indexPath.row].id else { return }
        let storyBoard = UIStoryboard(name: "Discover", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "DiscoverViewController") as DiscoverViewController
        nextViewController.genreName = self.genreData?.genres[indexPath.row].name
        nextViewController.genresId = String(id)
        nextViewController.screenType = .genres
        self.show(nextViewController, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 30) / 2
        let height = width * 3 / 3.7 + 20
        return CGSize(width: width, height: height )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 20, right: 10)
    }
    
}
