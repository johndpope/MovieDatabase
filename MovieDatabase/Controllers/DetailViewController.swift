//
//  DetailViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 13.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var MovieDetailTableView: UITableView!
    
    enum ScreenType {
        case movie
        case series
    }
    
    var identifier: Int!
    var movieName: String!
    var type: ScreenType!
    var detailData: MoviesDetailModel?
    var trailerData: String?
    var castData: CastModel?
    var similarData: SimilarModel?
    var group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        getDetail()
        getTrailer()
        getCast()
        getSimilar()
        navigationItem.title = movieName
        group.notify(queue: .main) {
            self.MovieDetailTableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    //MARK: - Request Functions
    func getDetail() {
        group.enter()
        DetailMovieRequest.init(id: identifier).request(success: { (object) in
            self.detailData = object
            self.group.leave()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func getTrailer() {
        group.enter()
        VideoRequest(movieId: identifier).request(success: { (object) in
            if let first = object.results.first, let key = first.key, let _ = first.site {
                switch first.site {
                case .youtube:
                    self.trailerData = key
                default:
                    break
                }
                self.group.leave()
            }
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
    
    //MARK: - Set Delegates Here
    func setDelegates(){
        MovieDetailTableView.delegate = self
        MovieDetailTableView.dataSource = self
        MovieDetailTableView.register(MoviesDetailTableViewCell.self)
        MovieDetailTableView.register(TrailerTableViewCell.self)
        MovieDetailTableView.register(CastTableViewCell.self)
        MovieDetailTableView.register(SimilarTableViewCell.self)
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: - Sections
    enum Sections: Int, CaseIterable {
        case movie
        case trailer
        case cast
        case similar
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
        case .trailer:
            if trailerData != nil {
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
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch Sections(rawValue: indexPath.section)!{
        case .movie:
            let cell: MoviesDetailTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.fillDetailMovie(moviesResponse: detailData!)
            return cell
        case .trailer:
            let cell: TrailerTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.urlString = trailerData
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
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        _ = tableView.frame.height
        let width = tableView.frame.width
        switch Sections(rawValue: indexPath.section)!{
        case .movie:
            return UITableView.automaticDimension
        case .trailer:
            return UITableView.automaticDimension
        case .cast:
            return 200
        case .similar:
            return width / 1.3
            
        }
    }
}

extension DetailViewController: SimilarTableViewCellDelegate, CastTableViewCellDelegate {
    
    func didCastSelected(id: Int, castName: String) {
        let storyBoard = UIStoryboard(name: "CastDetail", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "CastDetailViewController") as CastDetailViewController
        nextViewController.identifier = id
        nextViewController.castName = castName
        self.show(nextViewController, sender: nil)
    }
    
    func didSimilarSelected(id: Int, similarName: String){
        let storyBoard = UIStoryboard(name: "Detail", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "DetailViewController") as DetailViewController
        nextViewController.identifier = id
        self.show(nextViewController, sender: nil)
    }
    
}
