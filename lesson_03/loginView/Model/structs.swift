//
//  Users.swift
//  loginView
//
//  Created by Олег Дмитриев on 10.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

protocol nameOf {
    var name: String { get set }
    var avatar: UIImage { get set }
    var ruName: String { get set }
}

struct friend: nameOf {
    var name: String
    var avatar: UIImage
    var ruName: String
}

struct Groups: nameOf {
    var name: String
    var avatar: UIImage
    var ruName: String
}
