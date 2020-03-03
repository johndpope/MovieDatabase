//
//  DetailViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 13.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    var identifier: Int!
    var castData: CastModel?
    var detailData: DetailModel?
    var similarData: SimilarModel?
    var topRatedData: TopRatedModel?
    
    @IBOutlet weak var MovieDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        getDetail()
        getSimilar()
        getCast()
        getTopRated()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        setNavigation()
    }
    
    //MARK: - Web Functions
    func getDetail() {
        DetailMovieRequest.init(id: identifier).request(success: { (object) in
            self.detailData = object
            self.MovieDetailTableView.reloadData()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func getCast() {
        CastRequest.init(id: identifier).request(success: {(object) in
            self.castData = object
            self.MovieDetailTableView.reloadData()
        }) {(error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func getSimilar() {
        SimilarMovieRequest.init(id: identifier).request(success: {(object) in
            self.similarData = object
            self.MovieDetailTableView.reloadData()
        }) {(error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func getTopRated() {
        TopRatedRequest.init().request(success: {(object) in
            self.topRatedData = object
            self.MovieDetailTableView.reloadData()
        }) {(error) in
            
        }
    }
    
    //MARK: - Set Navigationbar Here
    private func setNavigation(){
        //Navigasyon Barını Transparan Yapma.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    //MARK: - Set Delegates Here
    private func setDelegates(){
        MovieDetailTableView.delegate = self
        MovieDetailTableView.dataSource = self
        MovieDetailTableView.register(DetailCell.self)
        MovieDetailTableView.register(SimilarTableViewCell.self)
        MovieDetailTableView.register(TopRatedTableViewCell.self)
        MovieDetailTableView.register(CastTableViewCell.self)
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Sections
    enum Sections: Int, CaseIterable {
        case movie
        case cast
        case similar
        case topRated
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch Sections(rawValue: section)! {
        case .movie:
            if detailData != nil {
                return 1
            }
            return 0
        case .cast:
            if castData != nil {
                return 1
            }
            return 0
        case .similar:
            return 1
        case .topRated:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch Sections(rawValue: indexPath.section)!{
        case .movie:
            let cell: DetailCell = tableView.dequeueReusableCell(for: indexPath)
            cell.fillDetailMovie(detailResponse: detailData!)
            return cell
        case .cast:
            let cell: CastTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.castData = castData
            cell.delegate = self
            return cell
        case .similar:
            let cell: SimilarTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.similarData = similarData
            cell.delegate = self
            return cell
        case .topRated:
            let cell: TopRatedTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.topRatedData = topRatedData
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = tableView.frame.height
        let width = tableView.frame.width
        switch Sections(rawValue: indexPath.section)!{
        case .movie:
            return UITableView.automaticDimension
        case .cast:
            return 190
        case .similar:
            return width / 1.7
        case .topRated:
            return height / 3
        }
    }
}

extension DetailViewController: SimilarTableViewCellDelegate, CastTableViewCellDelegate {
    
    func didCastSelected(id: Int) {
        let storyBoard = UIStoryboard(name: "CastDetail", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "CastDetailViewController") as CastDetailViewController
        nextViewController.identifier = id
        self.show(nextViewController, sender: nil)
    }
    
    func didSimilarSelected(id: Int){
        let storyBoard = UIStoryboard(name: "Detail", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "DetailViewController") as DetailViewController
        nextViewController.identifier = id
        self.show(nextViewController, sender: nil)
    }
    
}
