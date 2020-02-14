//
//  LikeView.swift
//  loginView
//
//  Created by Олег Дмитриев on 14.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

    var heartColor = UIColor.red

class LikeView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        //context.setFillColor(UIColor.yellow.cgColor)
        //context.fill(CGRect(x:0, y:0, width: 25, height: 25))
        context.setStrokeColor(heartColor.cgColor)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x:13, y:0))
        path.addLine(to: CGPoint(x:15, y:10))
        path.addLine(to: CGPoint(x:25, y:10))
        path.addLine(to: CGPoint(x:18, y:15))
        path.addLine(to: CGPoint(x:23, y:25))
        path.addLine(to: CGPoint(x:13, y:17))
        path.addLine(to: CGPoint(x:3, y:25))
        path.addLine(to: CGPoint(x:8, y:15))
        path.addLine(to: CGPoint(x:0, y:10))
        path.addLine(to: CGPoint(x:10, y:10))
        path.close()
        path.stroke()
    }
    
    /*
     Это при нажатии на само вью, а надо оказывается через кнопку.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self)
            // do something with your currentPoint
            heartColor = heartColor == UIColor.red ? UIColor.green : UIColor.red
           self.setNeedsDisplay()
        }
    }
     */
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
