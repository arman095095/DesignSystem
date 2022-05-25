//
//  Badge.swift
//  diffibleData
//
//  Created by Arman Davidoff on 26.11.2020.
//  Copyright © 2020 Arman Davidoff. All rights reserved.
//

import UIKit

public final class Badge: UILabel {
    
    private var widthConstraint: NSLayoutConstraint?
    
    public init() {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        layer.cornerRadius = self.bounds.height/2
        clipsToBounds = true
    }
    
    public func setBadgeCount(count: Int?) {
        guard let count = count else {
            self.isHidden = true
            return
        }
        guard count != 0 else {
            self.isHidden = true
            return
        }
        self.isHidden = false
        self.text = "\(count)"
        let width = "\(count)".width(font: font) + Constants.badgeInset
        let newWidth =  width < Constants.badgeHeight ? Constants.badgeHeight : width
        widthConstraint?.constant = newWidth
        layoutIfNeeded()
    }
}

private extension Badge {
    
    func setupViews() {
        backgroundColor = UIColor.mainApp()
        font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textColor = .white
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: Constants.badgeHeight).isActive = true
        self.widthConstraint = widthAnchor.constraint(equalToConstant: 0)
        widthConstraint?.isActive = true
    }
}
