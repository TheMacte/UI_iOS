//
//  GroupCell.swift
//  loginView
//
//  Created by Олег Дмитриев on 10.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    @IBOutlet weak var GroupCellLable: UILabel!
    @IBOutlet weak var groupPicView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        //Ловим нажате
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        groupPicView.isUserInteractionEnabled = true
        groupPicView.addGestureRecognizer(tabGesture)
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
            self.groupPicView.layer.add(animation, forKey: nil)
        }
}
