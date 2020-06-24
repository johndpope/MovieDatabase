//
//  CastDetailViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 27.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class CastDetailViewController: UIViewController {
    
    var identifier: Int!
    var castName: String!
    var actData: ActElements!
    var filmographyData: FilmographyModel!

    @IBOutlet weak var castFilmographyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAct()
        setDelegates()
        getFilmography()
        navigationItem.title = castName
    }
    
    //MARK: - Request Functions
    
    func getAct() {
        ActRequest.init(id: identifier).request(success: {(object) in
            self.actData = object
            self.castFilmographyTableView.reloadData()
        }) {(error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func getFilmography() {
        FilmographyRequest.init(personId: identifier).request(success: {(object) in
            self.filmographyData = object
            self.castFilmographyTableView.reloadData()
            print("********************************\(self.filmographyData.cast.count)***************************")
        }) {(error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    //MARK: - Delegates & Layers Functions
        
    func setDelegates() {
        castFilmographyTableView.delegate = self
        castFilmographyTableView.dataSource = self
        castFilmographyTableView.register(CastBioTableViewCell.self)
        castFilmographyTableView.register(FilmographyTableViewCell.self)
    }
    
}

extension CastDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Sections
    
    enum Sections: Int, CaseIterable {
        case actBio
        case actFilmography
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections(rawValue: section)! {
        case .actBio:
            if actData != nil {
                return 1
            }
            return 0
        case .actFilmography:
            if filmographyData != nil {
                return 1
            }
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch Sections(rawValue: indexPath.section)! {
        case .actBio:
            let cell: CastBioTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.fillActBio(actBioResponse: actData)
            return cell
        case .actFilmography:
            let cell: FilmographyTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.filmographyData = filmographyData
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = tableView.frame.height
        let width = tableView.frame.width
        switch Sections(rawValue: indexPath.section)! {
        case .actBio:
            return height / 1.5
        case .actFilmography:
            return width / 1.4
        }

    }
    
}
