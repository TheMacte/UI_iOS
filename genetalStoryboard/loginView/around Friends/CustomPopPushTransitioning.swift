//
//  CustomPopPushTransitioning.swift
//  loginView
//
//  Created by Олег Дмитриев on 02.03.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class CustomPushAnimater: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
        let destination = transitionContext.viewController(forKey: .to) else { return }
        
        
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        destination.view.transform = .init(rotationAngle: -.pi / 2)
        destination.view.frame.origin.x += destination.view.frame.width
        destination.view.frame.origin.y -= (destination.view.frame.height - destination.view.frame.width) / 2
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.75,
                                                       animations: {
                                                        destination.view.transform = destination.view.transform.rotated(by: .pi / 2)
                                                        destination.view.frame.origin.x = 0
                                                        destination.view.frame.origin.y = 0
                                    })
        }) { (finished) in
            if finished && !transitionContext.transitionWasCancelled{
                destination.view.transform = .identity
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
        
    }
}

class CustomPopAnimater: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from),
            let destination = transitionContext.viewController(forKey: .to) else { return }

        transitionContext.containerView.insertSubview(destination.view, belowSubview: source.view)
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.75,
                                                       animations: {
                                                            source.view.transform = source.view.transform.rotated(by: -.pi / 2)
                                                            source.view.frame.origin.x += source.view.frame.width
                                    })
        }) { (finished) in
            if finished && !transitionContext.transitionWasCancelled{
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
        
    }
}
