//
//  FooterView.swift
//  
//
//  Created by Арман Чархчян on 02.05.2022.
//

import Foundation
import UIKit

public protocol FooterInfoViewProtocol: UIView {
    func start(count: Int)
    func stop(count: Int, info: String)
}

public final class FooterInfoView: UIView, FooterInfoViewProtocol {

    private let postsCountLabel: UILabel = {
        var view = UILabel()
        view.numberOfLines = 0
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        view.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        var view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
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
    
    public func start(count: Int) {
        postsCountLabel.text = String.localizedStringWithFormat(NSLocalizedString("news feed cells count", comment: ""), count)
        activityIndicator.startAnimating()
    }

    public func stop(count: Int, info: String) {
        postsCountLabel.text = String.localizedStringWithFormat(NSLocalizedString("news feed cells count", comment: ""), count) + "\n" + info
        activityIndicator.stopAnimating()
    }
}

private extension FooterInfoView {

    func setupViews() {
        backgroundColor = .black
        addSubview(postsCountLabel)
        addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.topAnchor.constraint(equalTo: bottomAnchor,constant: 5).isActive = true
        postsCountLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor,constant: 5).isActive = true
        postsCountLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
}
