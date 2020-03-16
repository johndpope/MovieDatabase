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
        navigationBar.barTintColor =  AppColors.navigationBarColor
    }
    
    func leftBackButton() {
        let backImage = UIImage(named: "back")
        navigationBar.backIndicatorImage = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationBar.tintColor = AppColors.navigationButtonColor
        
        let barButtonItemAppearance = UIBarButtonItem.appearance()
        let barButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        barButtonItemAppearance.setTitleTextAttributes(barButtonAttributes, for: .normal)
        barButtonItemAppearance.setTitleTextAttributes(barButtonAttributes, for: .highlighted)

    }
    
}
