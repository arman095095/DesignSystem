//
//  BlackListViewCell.swift
//  diffibleData
//
//  Created by Arman Davidoff on 25.12.2020.
//  Copyright © 2020 Arman Davidoff. All rights reserved.
//

import UIKit
import SDWebImage

public protocol ListCellViewModelProtocol {
    var name: String { get }
    var imageURL: URL? { get }
}

public struct ListCellViewModel: ListCellViewModelProtocol {
    public var name: String
    public var imageURL: URL?
    
    public init(name: String, imageURL: URL?) {
        self.name = name
        self.imageURL = imageURL
    }
}

public final class ListViewCell: UITableViewCell {
    
    public static let id = Constants.id
    private let userImageView = UIImageView()
    private let userNameLabel = UILabel()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func config(with model: ListCellViewModelProtocol) {
        userImageView.sd_setImage(with: model.imageURL)
        userNameLabel.text = model.name
    }
}

private extension ListViewCell {
    
    struct Constants {
        static let id = "ListViewCell"
        static let heightImageView: CGFloat = 40
        static let heightRow: CGFloat = 50
        static let leading: CGFloat = 8
        static let trailing: CGFloat = 15
    }
    
    func setupViews() {
        contentView.backgroundColor = .systemGray6
        userNameLabel.numberOfLines = 1
        userImageView.layer.cornerRadius = Constants.heightImageView/2
        userImageView.layer.masksToBounds = true
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(userNameLabel)
        contentView.addSubview(userImageView)
    }
    
    func setupContraints() {
        userImageView.heightAnchor.constraint(equalToConstant: Constants.heightImageView).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: Constants.heightImageView).isActive = true
        userImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.leading).isActive = true
        
        userNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.trailing).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: Constants.leading).isActive = true
    }
}
