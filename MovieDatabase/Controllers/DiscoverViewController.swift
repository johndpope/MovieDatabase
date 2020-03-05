//
//  DiscoverViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 4.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class DiscoverViewController: UIViewController {
    
    var genresId: String!
    var totalPage: Int!
    var genresData: MovieModel!

    @IBOutlet weak var discoverTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        discoverRequest()
        
    }
    
    func discoverRequest() {
        DiscoverRequest.init(genresId: genresId).request(success: { (object) in
            self.genresData = object
            self.discoverTableView.reloadData()
            print("******************************\(self.genresData.results.count)******************************")
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
        if genresData != nil {
          return  genresData.results.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NowPlayingCell = tableView.dequeueReusableCell(for: indexPath)
        cell.fillDiscoverList(discoverResponse: genresData!.results![indexPath.row])
        return cell
    }
    
}
