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
    var seriesName: String!
    var seriesCastData: SeriesCastModel?
    var seriesData: SeriesDetailModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        tvSeriesRequest()
        tvSeriesCastRequest()
        navigationItem.title = seriesName
    }
    
    func tvSeriesRequest() {
        SeriesDetailRequest.init(id: identifier).request(success: { (object) in
            self.seriesData = object
            self.seriesDetailTableView.reloadData()
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func tvSeriesCastRequest() {
        SeriesCastRequest.init(id: identifier).request(success: { (object) in
            self.seriesCastData = object
            self.seriesDetailTableView.reloadData()
            print("*************************\(String(describing: self.seriesCastData?.cast.count))******************************")
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    //MARK: - Set Delegates Here
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
        } else if seriesCastData != nil {
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
