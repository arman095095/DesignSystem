//
//  File.swift
//  
//
//  Created by Арман Чархчян on 16.04.2022.
//

import UIKit

public final class EmptyHeaderView: UICollectionReusableView {
    
    public enum InfoType: String {
        case emptyPeople = "Пользователей нет"
        case emptyActiveChats = "Активных чатов нет"
        case emptyBlackList = "Заблокированных пользователей нет"
        case emptyPosts = "Постов пока нет"
        
        var imageName: String {
            switch self {
            case .emptyPeople:
                return "person.2"
            case .emptyActiveChats:
                return "message"
            case .emptyBlackList:
                return "person.2"
            case .emptyPosts:
                return "rectangle.stack.person.crop"
            }
        }
    }
    
    static let idHeader = "EmptyView"
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
        case .emptyPeople:
            setupConstraintsPeopleView()
        case .emptyActiveChats:
            setupConstraintsActiveChatsView()
        case .emptyBlackList:
            setupConstraintsPeopleView()
        case .emptyPosts:
            setupConstraintsPeopleView()
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

    func setupConstraintsPeopleView() {
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: UIScreen.main.bounds.height/5).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 12).isActive = true
    }
    
    func setupConstraintsActiveChatsView() {
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: UIScreen.main.bounds.height/12).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 12).isActive = true
    }
}
