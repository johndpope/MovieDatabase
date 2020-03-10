//
//  DetailViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 13.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var MovieDetailTableView: UITableView!
    
    enum ScreenType {
        case movie
        case series
    }
    
    var identifier: Int!
    var type: ScreenType!
    var castData: CastModel?
    var detailData: MoviesDetailModel?
    var similarData: SimilarModel?
    var topRatedData: TopRatedModel?
    
    var group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        getDetail()
        getSimilar()
        getCast()
        getTopRated()
        
        group.notify(queue: .main) {
            self.MovieDetailTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        setNavigation()
    }
    
    
    
    //MARK: - Web Functions
    func getDetail() {
        group.enter()
        DetailMovieRequest.init(id: identifier).request(success: { (object) in
            self.detailData = object
            self.group.leave()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func getCast() {
        group.enter()
        CastRequest.init(id: identifier).request(success: {(object) in
            self.castData = object
            self.group.leave()
        }) {(error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func getSimilar() {
        group.enter()
        SimilarMovieRequest.init(id: identifier).request(success: {(object) in
            self.similarData = object
            self.group.leave()
        }) {(error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func getTopRated() {
        group.enter()
        TopRatedRequest.init().request(success: {(object) in
            self.topRatedData = object
            self.group.leave()
        }) {(error) in
             print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
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
        MovieDetailTableView.register(MoviesDetailTableViewCell.self)
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
            let cell: MoviesDetailTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.fillDetailMovie(moviesResponse: detailData!)
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
            return 200
        case .similar:
            return width / 1.6
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
