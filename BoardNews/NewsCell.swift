//
//  NewsCell.swift
//  BoardNews
//
//  Created by Serina Chen on 5/13/20.
//  Copyright © 2020 Serina Chen. All rights reserved.
//

import UIKit
class NewsCell: UITableViewCell{
    
    static let reuseIdentifier = "NewsCell"
    let newsImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "circle.fill")
       return $0
    }(UIImageView())
    
    let newsTitleLabel: UILabel = {
        
        $0.text = "Title"
        $0.font = UIFont.preferredFont(forTextStyle: .headline)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    let newsSubitleLabel: UILabel = {
        
        $0.text = "Subtitle"
        $0.font = UIFont.preferredFont(forTextStyle: .callout)
        $0.numberOfLines = 0
        $0.textColor = UIColor.secondaryLabel
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        // built-in contentview
        
        contentView.addSubview(newsImageView)
        contentView.addSubview(newsTitleLabel)
        contentView.addSubview(newsSubitleLabel)
        
        contentView.addConstraints([
        
            newsImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            newsImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            newsImageView.widthAnchor.constraint(equalToConstant: 80),
            newsImageView.heightAnchor.constraint(equalToConstant: 80),
            
            newsTitleLabel.leftAnchor.constraint(equalTo: newsImageView.rightAnchor, constant: 10),
            newsTitleLabel.bottomAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -5),
            newsTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            
            newsSubitleLabel.leftAnchor.constraint(equalTo: newsImageView.rightAnchor, constant: 10),
            newsSubitleLabel.topAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 5),
            newsSubitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: -15),
            newsSubitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
    }
}

