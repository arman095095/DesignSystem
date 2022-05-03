//
//  ButtonExtenshion.swift
//  diffibleData
//
//  Created by Arman Davidoff on 23.02.2020.
//  Copyright © 2020 Arman Davidoff. All rights reserved.
//

import UIKit
import Foundation

extension UIButton {
    public convenience init(backgroundColor: UIColor,
                     titleColor: UIColor,
                     font: UIFont?,
                     shadow: Bool,
                     cornerRaduis: CGFloat,
                     height: CGFloat,
                     shadowColor: UIColor?) {
        self.init(type: .system)
        self.setTitleColor(titleColor,for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRaduis
        self.setupConstraints(height: height)
        guard shadow else { return }
        setupShadow(shadowColor: shadowColor)
    }
    
    public convenience init(image: UIImage) {
        self.init(type: .system)
        self.setImage(image, for: .normal)
    }
    
    //Color for image(systemtype)
    public func setupForSystemImageColor(color: UIColor) {
        let template = self.currentImage?.withRenderingMode(.alwaysTemplate)
        self.setImage(template, for: .normal)
        self.tintColor = color
    }
}

private extension UIButton {
    
    func setupShadow(shadowColor: UIColor?) {
        if let shadowColor = shadowColor {
            layer.shadowColor = shadowColor.cgColor
        } else {
            layer.shadowColor = UIColor.black.cgColor
        }
        layer.shadowOffset = UIButton.Constants.shadowOffset
        layer.shadowRadius = UIButton.Constants.shadowRaduis
        layer.shadowOpacity = UIButton.Constants.shadowOpacity
    }
    
    func setupConstraints(height: CGFloat?) {
        guard let height = height else { return }
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}

extension UIButton {
    struct Constants {
        static let font = UIFont.avenir20()
        static let cornerRaduis: CGFloat = 4
        static let shadowRaduis: CGFloat = 4
        static let height: CGFloat = 60
        static let shadowOffset: CGSize = CGSize(width: 0, height: 4)
        static let shadowOpacity: Float = 0.2
    }
}
