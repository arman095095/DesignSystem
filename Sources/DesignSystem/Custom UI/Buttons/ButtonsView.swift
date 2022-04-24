//
//  ButtonsView.swift
//  diffibleData
//
//  Created by Arman Davidoff on 27.11.2020.
//  Copyright © 2020 Arman Davidoff. All rights reserved.
//

import UIKit

public final class ButtonsView: UIView {
    
    public var firstButton: UIButton =  {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = Constants.buttonFont
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    public var secondButton: UIButton =  {
        let button = UIButton(type: .system)
        button.titleLabel?.font = Constants.buttonFont
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.mainApp(), for: .normal)
        return button
    }()
    
    private var countLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public init() {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setTitles(firstButtonTitle: String, secondButtonTitle: String) {
        firstButton.setTitle(firstButtonTitle, for: .normal)
        secondButton.setTitle(secondButtonTitle, for: .normal)
    }
    
    public func setupCount(count: Int) {
        countLabel.text = "\(count)"
    }
}

private extension ButtonsView {
    
    func setupViews() {
        addSubview(firstButton)
        addSubview(countLabel)
        addSubview(secondButton)
    }
    
    func setupConstraints() {
        firstButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        firstButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        firstButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        firstButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth).isActive = true
        firstButton.heightAnchor.constraint(equalToConstant: Constants.buttonFont.lineHeight).isActive = true
        
        countLabel.leadingAnchor.constraint(equalTo: firstButton.trailingAnchor,constant: 10).isActive = true
        countLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        countLabel.heightAnchor.constraint(equalToConstant: Constants.buttonFont.lineHeight).isActive = true
        
        secondButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        secondButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        secondButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        secondButton.leadingAnchor.constraint(equalTo: countLabel.trailingAnchor,constant: -10).isActive = true
        secondButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth).isActive = true
        secondButton.heightAnchor.constraint(equalToConstant: Constants.buttonFont.lineHeight).isActive = true
    }
}
