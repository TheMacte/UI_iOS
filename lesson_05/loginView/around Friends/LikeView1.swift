//
//  LikeView.swift
//  loginView
//
//  Created by Олег Дмитриев on 14.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

var touchedLike1Btn: Bool = false

class LikeView1: UIView {
    
    func line() {
        let heartIcon = UIBezierPath()
        heartIcon.move(to: CGPoint(x:4, y:0))
        heartIcon.addLine(to: CGPoint(x:6, y:0))
        heartIcon.addLine(to: CGPoint(x:10, y:4))
        heartIcon.addLine(to: CGPoint(x:14, y:0))
        heartIcon.addLine(to: CGPoint(x:16, y:0))
        heartIcon.addLine(to: CGPoint(x:20, y:4))
        heartIcon.addLine(to: CGPoint(x:20, y:8))
        heartIcon.addLine(to: CGPoint(x:10, y:18))
        heartIcon.addLine(to: CGPoint(x:0, y:8))
        heartIcon.addLine(to: CGPoint(x:0, y:4))
        heartIcon.close()
        heartIcon.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        context.setFillColor(heartColor.cgColor)
        context.setStrokeColor(heartColor.cgColor)
        line()
    }
    

    /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            // do something with your currentPoint
            if showStatus == false {
                showStatus = true
                countOfLike += 1
                //likeCount.textColor = .green
                
            } else {
                showStatus = false
                countOfLike -= 1
                //likeCount.textColor = .none
            }
            
            //likeView.setNeedsDisplay()
            //likeCount.text = String(countOfLike)
            
        heartColor = heartColor == UIColor.red ? UIColor.green : UIColor.red
           self.setNeedsDisplay()
        }
    }
 */
     
}
