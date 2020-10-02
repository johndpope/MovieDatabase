//
//  TrendingViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 24.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {
    
    @IBOutlet weak var trendTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setDelegates() {
        trendTableView.delegate = self
        trendTableView.dataSource = self
        trendTableView.register(TrendingPeopleTableViewCell.self)
        trendTableView.register(TrendingMovieTableViewCell.self)
    }
    
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
