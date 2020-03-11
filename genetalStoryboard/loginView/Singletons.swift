//
//  Singletons.swift
//  loginView
//
//  Created by Олег Дмитриев on 11.03.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class Session {
    private init(){}
    
    static let shared: Session = .init();
    
    var token: String = .init();
    var userId: Int = .init();
}
