//
//  DotsViewController.swift
//  loginView
//
//  Created by DAN on 24.02.2020.
//  Copyright © 2020 DAN. All rights reserved.
//

import UIKit

class DotsViewController: UIViewController {
    @IBOutlet weak var dotsBack: DotsBack!
    @IBOutlet weak var firstDot: DotForLoading!
    @IBOutlet weak var secondDot: DotForLoading!
    @IBOutlet weak var thirdDot: DotForLoading!
    
    override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.firstDot.alpha = 1.0
        self.secondDot.alpha = 1.0
        self.thirdDot.alpha = 1.0
        dotDansing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func dotDansing(y: CGFloat = 10, alpha: CGFloat = 0.1){
        UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.firstDot.frame.origin.y += y
            self.firstDot.alpha = alpha
        })
        UIView.animate(withDuration: 1.0, delay: 0.5, options: [.repeat, .autoreverse], animations: {
            self.secondDot.frame.origin.y += y
            self.secondDot.alpha = alpha
        })
        UIView.animate(withDuration: 1.0, delay: 1, options: [.repeat, .autoreverse], animations: {
            self.thirdDot.frame.origin.y += y
            self.thirdDot.alpha = alpha
        })
    }
    
}
