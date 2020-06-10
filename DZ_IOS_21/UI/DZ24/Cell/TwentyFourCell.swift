//
//  TwentyFourCell.swift
//  DZ_IOS_21
//
//  Created by Roman Berezin on 10.06.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class TwentyFourCell: UITableViewCell {
    
    private let label: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
