//
//  FooterView.swift
//  DZ_IOS_21
//
//  Created by Roman Berezin on 28.05.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class FooterView: UIView {
    
    var label1 = UILabel()
    var label2 = UILabel()
    
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
        
        self.backgroundColor = .yellow
        
        label1.numberOfLines = 0
        label1.backgroundColor = .green
        
        label2.numberOfLines = 0
        label2.backgroundColor = .red
        
        self.addSubview(label1)
        self.addSubview(label2)
        makingConstraints()
    }
    
    func makingConstraints() {
        
        label1.snp.makeConstraints({ maker in
            maker.top.equalToSuperview().inset(10)
            maker.left.equalToSuperview().inset(20).labeled("label1 left constraint")
            maker.right.equalToSuperview().inset(20).priority(.high).labeled("label1 right constraint")
        })
        
        label2.snp.makeConstraints({ maker in
            maker.top.equalTo(label1.snp.bottom).offset(10).priority(.high)
            maker.bottom.equalToSuperview().inset(10)
            maker.left.equalToSuperview().inset(20).labeled("label2 left constraint")
            maker.right.equalToSuperview().offset(-20).priority(.high).labeled("label2 right constraint")
        })
    }
}
