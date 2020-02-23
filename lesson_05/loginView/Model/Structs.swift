//
//  Users.swift
//  loginView
//
//  Created by Олег Дмитриев on 10.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

protocol NameOf {
    var name: String { get set }
    var avatar: UIImage { get set }
    var ruName: String { get set }
}

struct Friend: NameOf {
    var name: String
    var avatar: UIImage
    var ruName: String
}

struct Groups: NameOf {
    var name: String
    var avatar: UIImage
    var ruName: String
}

struct News {
    var auther: String
    var autherAvatar: UIImage
    var newsImage: UIImage
    var newsText: String
}
    
