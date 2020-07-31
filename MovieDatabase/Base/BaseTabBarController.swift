//
//  BaseTabBarController.swift
//  MovieDatabase
//
//  Created by ilkay sever on 31.07.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
    
    func setTabBar() {
        tabBar.barTintColor = AppColors.tabBarColor
        tabBar.unselectedItemTintColor = AppColors.tabBarItemColor
        tabBar.tintColor = AppColors.tabBarItemHoverColor
    }
    
}
