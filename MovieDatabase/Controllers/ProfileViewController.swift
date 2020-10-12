//
//  ProfileViewController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 27.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var favData: ListModel?
    var watchData: ListModel?
    var profileImage: Gravatar?
    
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var settingsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfile()
        setDelegates()
        FavoriteNotification()
        WatchListNotification()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavoriteRequest()
        getWatchListRequest()
        // Hide NavitaionBar in this viewController.
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func setDelegates() {
        profileTableView.delegate = self
        profileTableView.dataSource = self
        profileTableView.register(FavoriteListTableViewCell.self)
        profileTableView.register(WatchListTableViewCell.self)
    }
    
    private func setProfile() {
//        profileImageView.image = UIImage(named: "\(profileImage?.hash ?? "person.circle.fill")")
//        let imgUrl = URL(string: "\(profileImage?.hash ?? "")")
//        profileImageView.kf.setImage(with: imgUrl, placeholder: UIImage(named: "person.circle.fill"))
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        profileNameLabel.text = Account.current.user.username
    }
    
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        
    }
    
    @objc func setLiked(_ notification: Notification) {
        getFavoriteRequest()
    }
    
    @objc func setAdded(_ notification: Notification) {
        getWatchListRequest()
    }
    
    func FavoriteNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(setLiked(_:)), name: NSNotification.Name("Liked"), object: nil)
    }
    
    func WatchListNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(setAdded(_:)), name: NSNotification.Name("Added"), object: nil)
    }
    
    func getFavoriteRequest() {
        FavoriteMovieRequest.init(id: Account.current.user.id, sessionId: Account.current.session.sessionId, listType: .favorite).request(success: { (object) in
            self.favData = object
            self.profileTableView.reloadData()
            
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
    func getWatchListRequest() {
        FavoriteMovieRequest.init(id: Account.current.user.id, sessionId: Account.current.session.sessionId, listType: .watchlist).request(success: { (object) in
            self.watchData = object
            self.profileTableView.reloadData()
            
        }) { (error) in
            print(#function,"******************* UPS!!! BEKLENMEDİK BİR HATA OLUŞTU. *******************")
        }
    }
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    enum Sections: Int, CaseIterable {
        case favList
        case watchList
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections(rawValue: section)! {
        case .favList:
            if favData != nil {
                return 1
            } else {
                return 0
            }
        case .watchList:
            if watchData != nil {
                return 1
            }else {
                return 0
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Sections(rawValue: indexPath.section)! {
        case .favList:
            let cell: FavoriteListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.getFavMovie(favMovie: favData!)
            return cell
        case .watchList:
            let cell: WatchListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.addWatchList(watchList: watchData!)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Sections(rawValue: indexPath.section)! {
        case .favList:
            return 360
        case .watchList:
            return 360
        }
    }
    
}
