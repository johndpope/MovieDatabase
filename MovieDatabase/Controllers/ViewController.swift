//
//  ViewController.swift
//  MovieDatabase
//
//  Created by Alihan Aktay on 10.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit
import AVKit
import YoutubePlayer_in_WKWebView

class ViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    var page: Int = 1
    var totalPage: Int!
    var upComingData: MovieModel?
    var nowData: MovieModel?
    var addFavorite: AddListModel?
    var tvSeriesData: SeriesModel?
    var trailerData: VideoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        upComingMovieRequest()
        nowMovieRequest()
        tvSeriesRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    //MARK: - Request Web Functions
    
    func upComingMovieRequest() {
        UpComingRequest.init(page: page).request(success: { (object) in
            self.upComingData = object
            self.movieTableView.reloadData()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func nowMovieRequest() {
        NowMovieRequest.init(page: page).request(success: { (object) in
            if self.nowData != nil{
                self.nowData?.results.append(contentsOf: object.results)
            }else{
                self.nowData = object
            }
            self.movieTableView.reloadData()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func tvSeriesRequest() {
        TvSeriesRequest.init(page: page).request(success: {(object) in
            self.tvSeriesData = object
            self.movieTableView.reloadData()
        }) {(error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    //MARK: - Delegates Methods
    
    func setDelegates(){
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(UpComingTableViewCell.self)
        movieTableView.register(NowTableViewCell.self)
        movieTableView.register(TvSeriesTableViewCell.self)
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    enum Sections: Int, CaseIterable {
        case upComing
        case nowMovie
        case tvSeries
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return Sections.allCases.count
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch Sections(rawValue: section)! {
        case .upComing:
            if upComingData != nil {
                return 1
            }
            return 0
        case .nowMovie:
            if nowData != nil {
                return 1
            }
            return 0
        case .tvSeries:
            if tvSeriesData != nil {
                return 1
            }
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch Sections(rawValue: indexPath.section)! {
        case .upComing:
            let cell: UpComingTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.upComingData = self.upComingData
            cell.delegate = self
            return cell
        case .nowMovie:
            let cell: NowTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.delegate = self
            cell.nowData = self.nowData
            return cell
        case .tvSeries:
            let cell: TvSeriesTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.delegate = self
            cell.tvSeriesData = self.tvSeriesData
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch Sections(rawValue: indexPath.section)! {
        case .upComing:
            return 300
        case .nowMovie:
            return 330
        case .tvSeries:
            return 250
        }
        
    }
    
}

extension ViewController: NowTableViewCellDelegate, UpComingTableViewCellDelegate, TvSeriesTableViewCellDelegate {
    
    func didUpComingSelected(id: Int) {
        VideoRequest(movieId: id).request(success: { (object) in
            if let first = object.results.first, let key = first.key, let site = first.site {
                switch first.site {
                case .youtube:
                    let url = URL(string: site.baseURL+key)!
                    let player = AVPlayer(url: url)
                    let controller = AVPlayerViewController()
                    controller.player = player
                    self.present(controller, animated: true) {
                        player.play()
                    }
                default:
                    break
                }
                
            }
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
        
    }
    
    func didNowMovieSelected(id: Int) {
        let storyBoard = UIStoryboard(name: "Detail", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "DetailViewController") as DetailViewController
        nextViewController.identifier = id
        self.show(nextViewController, sender: nil)
    }
    
    func didSeeAllNowSelected() {
        let storyBoard = UIStoryboard(name: "Discover", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "DiscoverViewController") as DiscoverViewController
        nextViewController.type = .nowMovies
        self.show(nextViewController, sender: nil)
    }
    
    func didSeeAllSeriesSelected() {
        let storyBoard = UIStoryboard(name: "Discover", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "DiscoverViewController") as DiscoverViewController
        nextViewController.type = .tvSeries
        self.show(nextViewController, sender: nil)
    }
    
}

