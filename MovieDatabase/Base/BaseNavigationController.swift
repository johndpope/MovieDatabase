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
        leftBackButton()
    }
    
    func setNavigationBar() {
        navigationBar.tintColor = AppColors.navigationButtonColor
        navigationBar.barTintColor =  AppColors.navigationBarColor
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.orange]
    }
    
    func leftBackButton() {
        let backImage = UIImage(named: "back")
        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
        
        let backButtonAppearance = UIBarButtonItem.appearance()
        let barButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        backButtonAppearance.setTitleTextAttributes(barButtonAttributes, for: .normal)
        backButtonAppearance.setTitleTextAttributes(barButtonAttributes, for: .highlighted)

    }
    
}
