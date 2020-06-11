//
//  TwentyTwoCell.swift
//  DZ_IOS_21
//
//  Created by Roman Berezin on 04.06.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class TwentyTwoCell: UITableViewCell {
    
    let userImage = UIImageView()
    let userNameLabel = UILabel()
    let date = UILabel()
    let commentLablel = UILabel()
    
    var model: DZ22CommentModel? {
        
        didSet {
            if let path = model?.userImage {
                userImage.sd_setImage(with: URL(string: path))
            } else {
                userImage.image = nil
            }
            userNameLabel.text = model?.userName ?? "None"
            date.text = model?.commentDate ?? "None"
            commentLablel.text = model?.commentText ?? "None"
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        
        commentLablel.numberOfLines = 0
        userImage.contentMode = .scaleAspectFit
        userImage.clipsToBounds = true
        
        userNameLabel.backgroundColor = .yellow
        date.backgroundColor = .gray
        commentLablel.backgroundColor = .green
        
        self.addSubview(userImage)
        self.addSubview(userNameLabel)
        self.addSubview(date)
        self.addSubview(commentLablel)
        
        userImage.snp.makeConstraints { maker in
            maker.height.equalTo(100).priority(.required).labeled(" IMAGE     HEIGHT ")
            maker.width.equalTo(80).labeled(" IMAGE     WIDTH ")
            maker.top.equalToSuperview().inset(10).labeled(" IMAGE     TOP ")
            maker.left.equalToSuperview().inset(10).labeled(" IMAGE     LEADING ")
            maker.bottom.lessThanOrEqualToSuperview().inset(10).priority(.high).labeled(" IMAGE     BOTTOM ")
        }
        
        userNameLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(10).labeled("NAME LABEL TOP")
            maker.left.equalTo(userImage.snp.right).offset(10).labeled("NAME LABEL LEFT")
            maker.right.lessThanOrEqualTo(date.snp.left).offset(10).labeled("NAME LABEL RIGHT")
        }
        
        date.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(10).labeled("DATE TOP")
            maker.right.equalToSuperview().inset(10).labeled("DATE RIGHT")
        }
        
        commentLablel.snp.makeConstraints { maker in
            maker.top.equalTo(userNameLabel.snp.bottom).offset(10)
            maker.left.equalTo(userImage.snp.right).offset(10).labeled("COMMENT LABEL LEFT")
            maker.right.equalToSuperview().inset(10).labeled("COMMENT LABEL RIGHT")
            maker.bottom.lessThanOrEqualToSuperview().inset(10).labeled("COMMENT LABEL BOTTOM")
        }
        
    }
}
