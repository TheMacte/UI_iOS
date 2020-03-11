//
//  FriendsCell.swift
//  loginView
//
//  Created by DAN on 09.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    @IBOutlet weak var FriendCellLable: UILabel!
    @IBOutlet weak var userPicView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Ловим нажате
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        userPicView.isUserInteractionEnabled = true
        userPicView.addGestureRecognizer(tabGesture)
    }
    
        //Обрабатываем нажатия
        @objc func tapped(_ sender: UITapGestureRecognizer) {
            let animation = CASpringAnimation(keyPath: "transform.scale")
            animation.fromValue = 0.9
            animation.toValue = 1
            animation.stiffness = 200
            animation.mass = 1
            animation.duration = 1
            animation.beginTime = CACurrentMediaTime()
            animation.fillMode = CAMediaTimingFillMode.backwards
            self.userPicView.layer.add(animation, forKey: nil)
        }
}
