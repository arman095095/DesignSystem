//
//  File.swift
//  
//
//  Created by Арман Чархчян on 02.05.2022.
//

import Foundation
import UIKit

public protocol ListsHeaderTitleViewOutput: AnyObject {
    func mainButtonAction()
}

public protocol ListsHeaderTitleViewProtocol: UIView {
    func setTitle(_ title: String)
}

public final class ListsHeaderTitleView: UIView, ListsHeaderTitleViewProtocol {
    
    public weak var output: ListsHeaderTitleViewOutput?
    
    private let mainButton: UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.contentHorizontalAlignment = .leading
        view.titleEdgeInsets = Constants.titleInsets
        view.setTitleColor(.gray, for: .normal)
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
        setupActions()
    }
    
    public func setTitle(_ title: String) {
        mainButton.setTitle(title, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ListsHeaderTitleView {
    
    struct Constants {
        static let titleInsets = UIEdgeInsets(top: 0,
                                              left: 15,
                                              bottom: 0,
                                              right: 0)
        static let cornerRadius: CGFloat = 9
        static let height: CGFloat = 35
        static let inset: CGFloat = 20
    }
    
    func setupViews() {
        backgroundColor = .systemGray6
        addSubview(mainButton)
    }
    
    func setupActions() {
        mainButton.addTarget(self,
                             action: #selector(buttonTapped),
                             for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        output?.mainButtonAction()
    }
    
    func setupConstraints() {
        mainButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mainButton.heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
        mainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.inset).isActive = true
        mainButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.inset).isActive = true
    }
}
