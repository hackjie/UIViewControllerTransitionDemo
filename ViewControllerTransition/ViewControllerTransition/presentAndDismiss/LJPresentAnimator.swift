//
//  LJPresentAnimator.swift
//  ViewControllerTransition
//
//  Created by 李杰 on 2019/3/8.
//  Copyright © 2019 李杰. All rights reserved.
//

import UIKit

class LJPresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // 区分 present 还是 dismiss
        
    }
}
