//
//  LoadButton.swift
//  diffibleData
//
//  Created by Arman Davidoff on 22.11.2020.
//  Copyright © 2020 Arman Davidoff. All rights reserved.
//

import UIKit

public final class LoadButton: UIButton {
    
    private let activity: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.hidesWhenStopped = true
        return view
    }()

    private let label = UILabel()
    
    public init(backgroundColor: UIColor,
         titleColor: UIColor,
         font: UIFont?,
         shadow: Bool,
         cornerRaduis: CGFloat,
         height: CGFloat,
         activityColor: UIColor,
         shadowColor: UIColor?) {
        super.init(frame: .zero)
        self.activity.color = activityColor
        self.label.font = font
        self.label.textColor = titleColor
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRaduis
        setupViews()
        setupConstraints(with: height)
        guard shadow else { return }
        setupShadow(shadowColor: shadowColor)
    }
    
    public override func setTitle(_ title: String?, for state: UIControl.State) {
        self.label.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func loading() {
        activity.isHidden = false
        label.isHidden = true
        activity.startAnimating()
    }
    
    public func stop() {
        label.isHidden = false
        activity.stopAnimating()
    }
}

//MARK: Setup UI
private extension LoadButton {
    
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

    func setupViews() {
        self.addSubview(label)
        self.addSubview(activity)
    }
    
    func setupConstraints(with height: CGFloat?) {
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        } else {
            heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activity.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activity.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        activity.widthAnchor.constraint(equalToConstant: frame.height).isActive = true
    }
}
