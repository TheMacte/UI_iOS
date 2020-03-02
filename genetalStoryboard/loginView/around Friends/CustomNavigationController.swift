//
//  CustomNavigationController.swift
//  loginView
//
//  Created by Олег Дмитриев on 02.03.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push{
            return CustomPushAnimater()
        }
        else if operation == .pop{
            return CustomPopAnimater()
        }
        
        return nil
    }
}
