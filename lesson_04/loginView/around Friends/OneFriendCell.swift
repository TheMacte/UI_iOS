//
//  OneFriendCell.swift
//  loginView
//
//  Created by Олег Дмитриев on 10.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

var countOfLike:Int = 10

class OneFriendCell: UICollectionViewCell {
    // Скругление и тень
    @IBOutlet var userFaceOfoneUser: UIImageView!
    @IBOutlet var userNameOfOneUser: UILabel!
    @IBOutlet weak var backView: UIView!
    
    // Нажатие на кнопку
    @IBOutlet weak var likeView: LikeView!
    @IBOutlet weak var likeCount: UILabel!
    
    // Нажатие на сердечко
    @IBOutlet weak var likeView1: LikeView1!
    @IBOutlet weak var likeCount1: LikeCount1!
    
    @IBAction func iLikeItButton(_ sender: Any) {
        if showStatus == false {
            showStatus = true
            countOfLike += 1
            likeCount.textColor = .green
        } else {
            showStatus = false
            countOfLike -= 1
            likeCount.textColor = .none
        }
        likeView.setNeedsDisplay()
        likeCount.text = String(countOfLike)
    }
    
    
    
    
    
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
        
        likeCount.text = String(countOfLike)
        
        //Ловим нажате
        let tabGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        likeView1.isUserInteractionEnabled = true
        likeView1.addGestureRecognizer(tabGesture)
    }
    
        //Обрабатываем нажатия
        @objc func tapped(_ sender: UITapGestureRecognizer) {
            if !touchedLike1Btn {
                touchedLike1Btn = true
                countOfLike += 1
                likeCount1.text = String(countOfLike)
                likeCount1.textColor = .red
                heartColor = UIColor.red
                likeView1.setNeedsDisplay()
                
            } else {
                touchedLike1Btn = false
                countOfLike -= 1
                likeCount1.text = String(countOfLike)
                likeCount1.textColor = .none
                heartColor = UIColor.green
                likeView1.setNeedsDisplay()
            }
             likeView1.setNeedsDisplay()
        }
}
