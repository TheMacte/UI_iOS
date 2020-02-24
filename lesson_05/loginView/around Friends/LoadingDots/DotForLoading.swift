//
//  Dot.swift
//  loginView
//
//  Created by DAN on 24.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class DotForLoading: UIView {

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }

}
