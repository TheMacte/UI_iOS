//
//  likeView.swift
//  loginView
//
//  Created by Олег Дмитриев on 23.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class LikeViewNews: UIView {
    var touchedLikeBtnNews: Bool = false
    
    private func lineLikeNews() {
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
        lineLikeNews()
    }
}
