//
//  ViewController.swift
//  MovieDatabase
//
//  Created by Alihan Aktay on 10.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    
    var page: Int = 1
    var totalPage: Int!
    var upComingData: MovieModel?
    var latestData: LatestModel?
    var nowData: MovieModel?
    var addFavorite: AddListModel?
    var tvSeriesData: SeriesModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        upComingMovieRequest()
        nowMovieRequest()
        tvSeriesRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide NavitaionBar in this viewController.
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    //MARK: - Request Web Functions
    
    func upComingMovieRequest() {
        UpComingRequest.init(page: page).request(success: { (object) in
            self.upComingData = object
            self.movieTableView.reloadData()
            print("*************************\(String(describing: self.upComingData?.results.count))*************************")
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
            self.totalPage = object.total_pages
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
        case now
        case series
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
        case .now:
            if nowData != nil {
                return 1
            }
            return 0
        case .series:
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
            return cell
        case .now:
            let cell: NowTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.delegate = self
            cell.page = self.page
            cell.totalPage = self.totalPage
            cell.nowData = self.nowData
            return cell
        case .series:
            let cell: TvSeriesTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.tvSeriesData = self.tvSeriesData
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch Sections(rawValue: indexPath.section)! {
        case .series:
            let storyBoard = UIStoryboard(name: "Detail", bundle: nil)
            let nextViewController = storyBoard.instantiateViewController(identifier: "DetailViewController") as DetailViewController
            let movie = tvSeriesData?.results[indexPath.row]
            nextViewController.identifier = movie?.id
            self.show(nextViewController, sender: nil)
        default:
            break
        }

    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch Sections(rawValue: indexPath.section)! {
        case .upComing:
            return 300
        case .now:
            return 330
        case .series:
            return 250
        }
        
    }
    
}

extension ViewController: NowTableViewCellDelegate {

    func didSelected(id: Int) {
        let storyBoard = UIStoryboard(name: "Detail", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(identifier: "DetailViewController") as DetailViewController
        nextViewController.identifier = id
        self.show(nextViewController, sender: nil)
    }
    
    func didPaginate() {
        self.page += 1
        nowMovieRequest()
    }
    
}

