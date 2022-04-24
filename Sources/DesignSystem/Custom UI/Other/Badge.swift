//
//  Badge.swift
//  diffibleData
//
//  Created by Arman Davidoff on 26.11.2020.
//  Copyright © 2020 Arman Davidoff. All rights reserved.
//

import UIKit

public final class Badge: UILabel {
    
    public init() {
        super.init(frame: .zero)
        backgroundColor = UIColor.mainApp()
        font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textColor = .white
        textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        self.layer.cornerRadius = self.bounds.height/2
        self.clipsToBounds = true
    }
    
    public func setBadgeCount(count: Int) {
        self.text = "\(count)"
    }
}
