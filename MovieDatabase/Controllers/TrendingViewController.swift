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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setSearchBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with withEvent: UIEvent?) {
        self.view.endEditing(true)
    }
    
    private func setDelegates() {
        trendTableView.delegate = self
        trendTableView.dataSource = self
        searchBar.delegate = self
        trendTableView.register(TrendingPeopleTableViewCell.self)
        trendTableView.register(TrendingMovieTableViewCell.self)
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
        //case tvSeries
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections(rawValue: section)! {
        case .people:
            return 1
        case .movie:
            return 1
//        case .tvSeries:
//            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Sections(rawValue: indexPath.section)! {
        case .people:
            let cell: TrendingPeopleTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
        case .movie:
            let cell: TrendingMovieTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            return cell
//        case .tvSeries:
//            //code here
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Sections(rawValue: indexPath.section)! {
        case .people:
            return 300
        case .movie:
            return 250
//        case .tvSeries:
//            return 250
//        case .topRated:
//            return 250
        }
        
    }
    
}
