//
//  OneFriendCell.swift
//  loginView
//
//  Created by Олег Дмитриев on 10.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

var countOfLike:Int = 10
let allPik:[String] = ["Alla", "Boris", "Clara", "Dmitriy"]

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
        
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action:  #selector(respondToSwipeGesture(_:)))
        swipeRight.direction = .right
        userFaceOfoneUser.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action:  #selector(respondToSwipeGesture(_:)))
        swipeLeft.direction = .left
        userFaceOfoneUser.addGestureRecognizer(swipeLeft)
        
        userFaceOfoneUser.isUserInteractionEnabled = true
        
    }
    var photoCounter:Int = 0
    
    @objc func respondToSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.right:
            rideSwipeByPhoto()
        case UISwipeGestureRecognizer.Direction.left:
            leftSwipeByPhot()
        default:
            print("none")
        }
    }
    
    private func rideSwipeByPhoto(){
        if(photoCounter < allPik.count - 1){
            photoCounter += 1
        } else {
            photoCounter = 0
        }
        
        //ВОТ МОМЕНТ АНИМАЦИИ
        userFaceOfoneUser.image  = UIImage(named: allPik[photoCounter])
    }
    
    private func leftSwipeByPhot(){
        if(photoCounter != 0){
            photoCounter -= 1
        } else {
            photoCounter = allPik.count - 1
        }
        
        UIView.animateKeyframes(withDuration: 2,
                                delay: 0,
                                options: [],
                                animations: {
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        self.userFaceOfoneUser.transform = CGAffineTransform(scaleX: 0.5,y: 0.5)
                                                        //self.userFaceOfoneUser.image  = UIImage(named: allPik[self.photoCounter])
                                                        
                                    })
                                    UIView.addKeyframe(withRelativeStartTime: 0.25,
                                                       relativeDuration: 0.25,
                                                       animations: {
                                                        self.userFaceOfoneUser.transform = CGAffineTransform(scaleX: 1,y: 1)
                                                        
                                    })
                                    //self.userFaceOfoneUser.image  = UIImage(named: allPik[self.photoCounter])
                                    //ВОТ МОМЕНТ АНИМАЦИИ
                                    //userFaceOfoneUser.image  = UIImage(named: allPik[photoCounter])
        },completion: nil
            //self.userFaceOfoneUser.image  = UIImage(named: allPik[self.photoCounter])
        )
        //self.userFaceOfoneUser.image  = UIImage(named: allPik[self.photoCounter])

    }
    //Обрабатываем нажатия
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        if !touchedLike1Btn {
            touchedLike1Btn = true
            countOfLike += 1
            UIView.transition(with: likeCount1,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.likeCount1.text = String(countOfLike)
            })
            likeCount1.textColor = .red
            heartColor = UIColor.red
            likeView1.setNeedsDisplay()
            
        } else {
            touchedLike1Btn = false
            countOfLike -= 1
            UIView.transition(with: likeCount1,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.likeCount1.text = String(countOfLike)
            })
            
            likeCount1.textColor = .none
            heartColor = UIColor.green
            likeView1.setNeedsDisplay()
        }
        likeView1.setNeedsDisplay()
    }
}
