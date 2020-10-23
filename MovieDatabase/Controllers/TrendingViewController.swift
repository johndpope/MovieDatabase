//
//  TrendingViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 24.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var trendTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var page: Int = 1
    var trendPersonData: TrendPersonModel!
    var trendMovieData: TrendMovieModel!
    var trendTvData: TrendTvModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setSearchBar()
        trendPersonRequest()
        trendMovieRequest()
        trendTvRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with withEvent: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func trendPersonRequest() {
        TrendPersonRequest.init(page: page).request(success: { (object) in
            self.trendPersonData = object
            self.trendTableView.reloadData()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func trendMovieRequest() {
        TrendMoviesRequest.init(page: page).request(success: { (object) in
            self.trendMovieData = object
            self.trendTableView.reloadData()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func trendTvRequest() {
        TrendTvRequest.init(page: page).request(success: { (object) in
            self.trendTvData = object
            self.trendTableView.reloadData()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    private func setDelegates() {
        trendTableView.delegate = self
        trendTableView.dataSource = self
        searchBar.delegate = self
        trendTableView.register(TrendingPeopleTableViewCell.self)
        trendTableView.register(TrendingMovieTableViewCell.self)
        trendTableView.register(TrendingTvTableViewCell.self)
    }
    
    private func setSearchBar() {
        searchBar.barStyle = .black
        searchBar.backgroundColor = AppColors.backgroundColor
        searchBar.searchTextField.backgroundColor = UIColor.white
    }
    
    //    func addSearchBar() {
    //        searchBar.delegate = self
    //        searchBar.showsCancelButton = false
    //        searchBar.showsScopeBar = false
    //
    //        searchBar.barStyle = .black
    //        searchBar.searchTextField.backgroundColor = .searchbarBackgroundPrimary
    //        searchBar.tintColor = .textPrimary
    //        searchBar.searchTextField.leftView?.tintColor = .textSecondary
    //        searchBar.searchTextField.textColor = .textPrimary
    //        searchBar.searchTextField.font = .font(.regular, size:
    //    }
    
}

extension TrendingViewController: UITableViewDataSource, UITableViewDelegate {
    
    enum Sections: Int, CaseIterable {
        case people
        case movie
        case tvSeries
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections(rawValue: section)! {
        case .people:
            if trendPersonData != nil {
                return 1
            }
            return 0
        case .movie:
            if trendMovieData != nil {
                return 1
            }
            return 0
        case .tvSeries:
            if trendTvData != nil {
                return 1
            }
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Sections(rawValue: indexPath.section)! {
        case .people:
            let cell: TrendingPeopleTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.trendPersonData = self.trendPersonData
            return cell
        case .movie:
            let cell: TrendingMovieTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.trendMovieData = self.trendMovieData
            return cell
        case .tvSeries:
            let cell: TrendingTvTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.trendTvData = self.trendTvData
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Sections(rawValue: indexPath.section)! {
        case .people:
            return 300
        case .movie:
            return 250
        case .tvSeries:
            return 250
        //case .topRated:
        //return 250
        }
        
    }
    
}
