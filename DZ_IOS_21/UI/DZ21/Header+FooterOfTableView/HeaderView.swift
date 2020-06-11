//
//  HeaderView.swift
//  DZ_IOS_21
//
//  Created by Roman Berezin on 28.05.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    
    let image = UIImageView()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        self.backgroundColor = .blue
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        label.numberOfLines = 0
        label.backgroundColor = .green
        self.addSubview(image)
        self.addSubview(label)
        makingConstraints()
    }
    
    func makingConstraints()  {
        image.snp.makeConstraints({ maker in
            maker.height.equalTo(100).priority(.required).labeled(" IMAGE     HEIGHT ")
            maker.width.equalTo(80).labeled(" IMAGE     WIDTH ")
            maker.top.equalToSuperview().inset(10).labeled(" IMAGE     TOP ")
            maker.left.equalToSuperview().inset(10).labeled(" IMAGE     LEADING ")
            maker.bottom.lessThanOrEqualToSuperview().inset(10).priority(.high).labeled(" IMAGE     BOTTOM ")
        })
        
        label.snp.makeConstraints({ maker in
            maker.top.equalToSuperview().inset(10).labeled(" LABEL     TOP ")
            maker.left.equalTo(image.snp.right).offset(10).priority(.high).labeled(" LABEL     LEADING ")
            maker.right.equalToSuperview().inset(10).priority(.high).labeled(" LABEL     TRAILING ")
            maker.bottom.lessThanOrEqualToSuperview().inset(10).priority(.high).labeled(" LABEL     BOTTOM ")
        })
    }
}
