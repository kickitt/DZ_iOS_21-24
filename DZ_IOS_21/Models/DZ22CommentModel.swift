//
//  DZ22CommentModel.swift
//  DZ_IOS_21
//
//  Created by Roman Berezin on 04.06.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class DZ22CommentModel: NSObject {

    let userImage: String // URL String
    let userName: String
    let commentDate: String
    let commentText: String
    
    init(userImage: String, userName: String, commentDate: String, commentText: String) {
        self.userImage = userImage
        self.userName = userName
        self.commentDate = commentDate
        self.commentText = commentText
    }
    
    
}
