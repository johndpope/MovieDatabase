//
//  CircleImageView.swift
//  MovieDatabase
//
//  Created by ilkay sever on 10.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImageView: UIImageView {
    
    //MARK: - Properties
    
    @IBInspectable var borderWidth: CGFloat = 0.2 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = .clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    //MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        layer.cornerRadius = frame.size.width/2
    }
    
}
