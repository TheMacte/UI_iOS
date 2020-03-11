//
//  LikeView.swift
//  loginView
//
//  Created by Олег Дмитриев on 14.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

    var heartColor = UIColor.green
    var showStatus: Bool = false

class LikeView: UIView {
    
    func line() -> UIBezierPath {
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
        //heartIcon.stroke()
        return heartIcon
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {return}
        context.setFillColor(heartColor.cgColor)
        //context.setFillColor(UIColor.red.cgColor)
        //context.fill(self)
        context.setStrokeColor(heartColor.cgColor)
        //line()
        showIcon(status:showStatus)
    }
    func showIcon(status:Bool){
        let heartIcon = line()
        if status == true {
            heartIcon.stroke()
        }
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
