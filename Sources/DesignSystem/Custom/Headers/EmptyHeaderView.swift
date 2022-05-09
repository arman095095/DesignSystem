//
//  File.swift
//  
//
//  Created by Арман Чархчян on 16.04.2022.
//

import UIKit
import CoreGraphics

public final class EmptyHeaderView: UICollectionReusableView {
    
    public enum InfoType: String {
        case emptyChats = "Активных чатов нет"
        case emptyBlackList = "Заблокированных пользователей нет"
        case emptyPosts = "Постов пока нет"
        
        var imageName: String {
            switch self {
            case .emptyChats:
                return "message"
            case .emptyBlackList:
                return "person.2"
            case .emptyPosts:
                return "rectangle.stack.person.crop"
            }
        }
    }
    
    public static let idHeader = Constants.headerID
    private var title = UILabel()
    private var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        removeAllConstraints()
        imageView.image = nil
    }
    
    public func config(type: InfoType, text: String? = nil) {
        title.text = type.rawValue
        if let text = text { title.text = text }
        imageView.image = UIImage(systemName: type.imageName)
        switch type {
        case .emptyChats:
            setupConstraintsChats()
        case .emptyBlackList:
            setupConstraintsDefault()
        case .emptyPosts:
            setupConstraintsDefault()
        }
    }
}

private extension EmptyHeaderView {
    
    func setupViews() {
        addSubview(title)
        addSubview(imageView)
        title.numberOfLines = 0
        title.textColor = .systemGray2
        title.font = UIFont.avenir20()
        title.textAlignment = .center
        imageView.tintColor = .systemGray3
        title.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupConstraintsDefault() {
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: UIScreen.main.bounds.height/Constants.ratio2).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constants.imageViewDefaultHeight).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Constants.imageViewDefaultWidth).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.ratio).isActive = true
    }
    
    func setupConstraintsChats() {
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: UIScreen.main.bounds.height/Constants.ratio).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: Constants.imageViewChatsHeight).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: Constants.imageViewDefaultWidth).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.ratio).isActive = true
    }
}

private extension EmptyHeaderView {
    struct Constants {
        static let ratio: CGFloat = 12
        static let ratio2: CGFloat = 5
        static let imageViewDefaultHeight: CGFloat = 50
        static let imageViewDefaultWidth: CGFloat = 80
        static let imageViewChatsHeight: CGFloat = 60
        static let headerID = "EmptyView"
    }
}
