//
//  LoadButton.swift
//  diffibleData
//
//  Created by Arman Davidoff on 22.11.2020.
//  Copyright © 2020 Arman Davidoff. All rights reserved.
//

import UIKit

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

public final class LoadButton: UIButton {
    
    struct Constants {
        static let font = UIFont.avenir20()
        static let cornerRaduis: CGFloat = 4
        static let shadowRaduis: CGFloat = 4
        static let height: CGFloat = 60
        static let shadowOffset: CGSize = CGSize(width: 0, height: 4)
        static let shadowOpacity: Float = 0.2
    }
    
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
                activityColor: UIColor,
                shadowColor: UIColor) {
        super.init(frame: .zero)
        self.activity.color = activityColor
        self.label.font = Constants.font
        self.label.textColor = titleColor
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = Constants.cornerRaduis
        setupViews()
        setupConstraints()
        setupShadow(shadowColor: shadowColor)
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
    
    public func setTitle(_ title: String) {
        self.label.text = title
    }
}

//MARK: Setup UI
private extension LoadButton {
    
    func setupViews() {
        self.addSubview(label)
        self.addSubview(activity)
        
    }
    
    func setupShadow(shadowColor: UIColor) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = Constants.shadowOffset
        self.layer.shadowRadius = Constants.shadowRaduis
        self.layer.shadowOpacity = Constants.shadowOpacity
    }
    
    func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activity.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        activity.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activity.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
        activity.widthAnchor.constraint(equalToConstant: frame.height).isActive = true
    }
}
