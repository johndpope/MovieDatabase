//
//  CastDetailViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 27.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit
import Kingfisher

class CastDetailViewController: UIViewController {
     
    var identifier: Int!
    var filmographyData: FilmographyModel!
    var castData: ActModel!{
        didSet {
            let imgUrl = URL(string: "https://image.tmdb.org/t/p/w500\(castData.profilePath ?? "")")
            castProfileImageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "default"))
            castNameLabel.text = castData.name
            castBirthDayLabel.text = castData.birthday
            castBirthLocationLabel.text = castData.placeOfBirth
            castBioTextView.text = castData.biography
            switch castData.gender! {
            case .male:
                castGenderImageView.image = UIImage(named: "male")
            case .female:
                castGenderImageView.image = UIImage(named: "female")
            }
        }
    }
    
    @IBOutlet weak var castFilmographyTableView: UITableView!
    @IBOutlet weak var castProfileImageView: UIImageView!
    @IBOutlet weak var castNameLabel: UILabel!
    @IBOutlet weak var castBirthDayLabel: UILabel!
    @IBOutlet weak var castBirthLocationLabel: UILabel!
    @IBOutlet weak var castGenderImageView: UIImageView!
    @IBOutlet weak var castBioTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCast()
        setLayer()
        setDelegates()
        getFilmography()

    }
    
    //MARK: - Request Functions
    
    func getCast() {
        ActRequest.init(id: identifier).request(success: {(object) in
            self.castData = object
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
    
    func setLayer() {
        castBioTextView.layer.cornerRadius = 5
        castProfileImageView.layer.cornerRadius = 5
    }
    
    func setDelegates() {
        castFilmographyTableView.delegate = self
        castFilmographyTableView.dataSource = self
        castFilmographyTableView.register(FilmographyTableViewCell.self)
    }
    
}

extension CastDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmographyData != nil ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FilmographyTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.filmographyData = filmographyData
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
}
