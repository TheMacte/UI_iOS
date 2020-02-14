//
//  OneFriendCell.swift
//  loginView
//
//  Created by Олег Дмитриев on 10.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class OneFriendCell: UICollectionViewCell {
    @IBOutlet var userFaceOfoneUser: UIImageView!
    @IBOutlet var userNameOfOneUser: UILabel!
    @IBOutlet weak var backView: UIView!
    
    @IBInspectable var color:UIColor = .red
    @IBInspectable var radius:CGFloat = 18
    @IBInspectable var opacity:Float = 0.5

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //userFaceOfoneUser.layer.masksToBounds = true
        userFaceOfoneUser.layer.cornerRadius = 50 // Скругление
        
        //Shadow
        backView.layer.cornerRadius = 50
        backView.layer.masksToBounds = false
        backView.layer.shadowColor = color.cgColor

        backView.layer.shadowOpacity = opacity
        backView.layer.shadowRadius = radius
        backView.layer.shadowOffset = CGSize.zero
        

    }
}
