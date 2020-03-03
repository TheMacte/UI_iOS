//
//  CustomInteractiveTransition.swift
//  loginView
//
//  Created by Олег Дмитриев on 03.03.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class CustomInteractiveTransition: UIPercentDrivenInteractiveTransition {
    var viewController: UIViewController? {
        didSet {
            let recognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleScreenEdgeGesture(_:)) )
            recognizer.edges = [.left]
            viewController?.view.addGestureRecognizer(recognizer)
        }
    }
    
    var hasStarted: Bool = false
    var shouldFinish: Bool = false
    
    @objc func handleScreenEdgeGesture(_ gesture: UIScreenEdgePanGestureRecognizer){
        switch gesture.state{
        case .began:
            self.hasStarted = true
            self.viewController?.navigationController?.popViewController(animated: true)
        case .changed:
            let translation = gesture.translation(in: gesture.view)
            let relativeTransition = translation.y / (gesture.view?.bounds.width ?? 1)
            let progress = max(0, min(1, relativeTransition)) // 0 <= progress <= 1
            self.shouldFinish = progress > 0.33
            self.update(progress)
        case .ended:
            self.hasStarted = false
            if self.shouldFinish {
                self.finish()
            }
            else {
                self.cancel()
            }
        case .cancelled:
            self.hasStarted = false
            self.cancel()
        default:
            return
        }
        
    }
}
