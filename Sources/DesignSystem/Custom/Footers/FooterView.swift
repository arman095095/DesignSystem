//
//  File.swift
//  
//
//  Created by Арман Чархчян on 02.05.2022.
//

import UIKit

public protocol FooterViewProtocol: UIView {
    func start()
    func stop(info: String)
}

public final class FooterView: UIView {
    
    private var infoLabel: UILabel = {
        var view = UILabel()
        view.numberOfLines = 0
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var activityIndicator: CustomActivityIndicator = {
        var view = CustomActivityIndicator()
        view.lineWidth = 2.1
        view.strokeColor = UIColor.mainApp()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func start() {
        infoLabel.text = ""
        infoLabel.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startLoading()
    }
    
    public func stop(info: String = "") {
        infoLabel.text = info
        activityIndicator.completeLoading(success: true)
        activityIndicator.isHidden = true
        infoLabel.isHidden = false
    }
}

private extension FooterView {
    
    func setupViews() {
        addSubview(infoLabel)
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.heightAnchor.constraint(equalToConstant: 22).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 22).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: bottomAnchor,constant: 5).isActive = true
        infoLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 8).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
