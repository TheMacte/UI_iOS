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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //userFaceOfoneUser.layer.masksToBounds = true
        userFaceOfoneUser.layer.cornerRadius = 50 // Скругление
        
        //Shadow
        backView.layer.cornerRadius = 50
        backView.layer.masksToBounds = false
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOpacity = 0.5
        backView.layer.shadowRadius = 8
        backView.layer.shadowOffset = CGSize.zero
        

    }
}
