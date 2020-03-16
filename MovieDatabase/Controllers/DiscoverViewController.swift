//
//  DiscoverViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 4.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {
    
    enum ScreenType {
        case genres
        case nowMovies
        case tvSeries
    }
    
    var page: Int! = 1
    var totalPage: Int!
    var genresId: String!
    var genreName: String!
    var genresData: MovieModel!
    var seriesData: SeriesModel!
    var type: ScreenType!
    
    @IBOutlet weak var discoverTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        
        switch type! {
        case .genres:
            self.title = genreName
            discoverRequest()
        case .nowMovies:
            self.title = "Vizyondakiler"
            nowMovieRequest()
        case .tvSeries:
            self.title = "Tv Dizileri"
            tvSeriesRequest()
        }
        
    }
    
    func discoverRequest() {
        DiscoverRequest.init(genresId: genresId, page: page).request(success: { (object) in
            if self.genresData != nil {
                self.genresData.results.append(contentsOf: object.results)
            } else {
                self.genresData = object
            }
            self.page = object.page
            self.totalPage = object.total_pages
            self.discoverTableView.reloadData()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func nowMovieRequest() {
        NowMovieRequest.init(page: page).request(success: { (object) in
            if self.genresData != nil {
                self.genresData.results.append(contentsOf: object.results)
            } else {
                self.genresData = object
            }
            self.page = object.page
            self.totalPage = object.total_pages
            self.discoverTableView.reloadData()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func tvSeriesRequest() {
        TvSeriesRequest.init(page: page).request(success: { (object) in
            if self.seriesData != nil {
                self.seriesData.results.append(contentsOf: object.results)
            } else {
                self.seriesData = object
            }
            self.page = object.page
            self.totalPage = object.total_pages
            self.discoverTableView.reloadData()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func setDelegates() {
        discoverTableView.delegate = self
        discoverTableView.dataSource = self
        discoverTableView.register(NowPlayingCell.self)
    }
    
}

extension DiscoverViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch type! {
        case .genres:
            if genresData != nil {
                return genresData.results.count
            }
        case .nowMovies:
            if genresData != nil {
                return genresData.results.count
            }
        case .tvSeries:
            if seriesData != nil {
                return seriesData.results.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NowPlayingCell = tableView.dequeueReusableCell(for: indexPath)
        
        switch type! {
        case .genres, .nowMovies:
            cell.fillDiscoverList(discoverResponse: genresData!.results![indexPath.row])
        case .tvSeries:
            cell.fillSeriesList(seriesResponse: seriesData!.results![indexPath.row])
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        switch type! {
        case .genres:
            if indexPath.row == genresData.results.count - 1 && page < totalPage {
                self.page += 1
                discoverRequest()
            }
        case .nowMovies:
            if indexPath.row == genresData.results.count - 1 && page < totalPage {
                self.page += 1
                nowMovieRequest()
            }
        case .tvSeries:
            if indexPath.row == seriesData.results.count - 1 && page < totalPage {
                self.page += 1
                tvSeriesRequest()
            }
        }

    }
    
}
