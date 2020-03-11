//
//  BaseNavigationController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 11.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    
    func setNavigationBar() {
        self.navigationBar.barTintColor =  AppColors.navigationBarColor
    }
    
}
