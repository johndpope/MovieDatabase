//
//  SeriesDetailViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 10.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class SeriesDetailViewController: UIViewController {
    
    @IBOutlet weak var seriesDetailTableView: UITableView!
    
    var page: Int!
    var identifier: Int!
    var seriesData: SeriesDetailModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        tvSeriesRequest()
//        setNavigationBar()
        
    }
    
//    func setNavigationBar() {
//        navigationController?.navigationBar.barTintColor = UIColor.init(red: 46.0/255.0, green: 46.0/255.0, blue: 46.0/255.0, alpha: 1.0)
//    }
    
    func tvSeriesRequest() {
        SeriesDetailRequest.init(id: identifier).request(success: { (object) in
            self.seriesData = object
            self.seriesDetailTableView.reloadData()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func setDelegates() {
        seriesDetailTableView.delegate = self
        seriesDetailTableView.dataSource = self
        seriesDetailTableView.register(SeriesDetailTableViewCell.self)
    }
    
}

extension SeriesDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if seriesData != nil {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SeriesDetailTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.fillSeriesMovie(seriesResponse: seriesData!)
        return cell
    }
    
}
