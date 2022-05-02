//
//  ButtonExtenshion.swift
//  diffibleData
//
//  Created by Arman Davidoff on 23.02.2020.
//  Copyright © 2020 Arman Davidoff. All rights reserved.
//

import UIKit
import Foundation

public extension UIButton {
    
    convenience init(backgroundColor: UIColor,
                titleColor: UIColor,
                shadowColor: UIColor) {
        self.init(frame: .zero)
        self.titleLabel?.font = Constants.font
        self.titleLabel?.textColor = titleColor
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = Constants.cornerRaduis
        setupShadow(color: shadowColor)
    }
    
    convenience init(image: UIImage?) {
        self.init(type: .system)
        self.setImage(image, for: .normal)
    }
    
    //Color for image(systemtype)
    func setupForSystemImageColor(color: UIColor) {
        let template = self.currentImage?.withRenderingMode(.alwaysTemplate)
        self.setImage(template, for: .normal)
        self.tintColor = color
    }
}

private extension UIButton {
    
    func setupShadow(color: UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.2
    }
}
