//
//  CustomNavigationController.swift
//  loginView
//
//  Created by Олег Дмитриев on 02.03.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    private let interactiveTransition = CustomInteractiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push{
            self.interactiveTransition.viewController = toVC
            return CustomPushAnimater()
        }
        else if operation == .pop{
            if navigationController.viewControllers.first != toVC {
                 self.interactiveTransition.viewController = toVC
            }
            return CustomPopAnimater()
        }
        
        return nil
    }
}
