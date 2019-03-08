//
//  LJModalTransitionDelegate.swift
//  ViewControllerTransition
//
//  Created by 李杰 on 2019/3/8.
//  Copyright © 2019 李杰. All rights reserved.
//

import UIKit

class LJModalTransitionDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LJPresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LJPresentAnimator()
    }
}
