//
//  LJNavigationAnimator.swift
//  ViewControllerTransition
//
//  Created by 李杰 on 2019/3/7.
//  Copyright © 2019 李杰. All rights reserved.
//

import UIKit

class LJNavigationAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    private var transitionType: UINavigationController.Operation
    
    init(type: UINavigationController.Operation) {
        transitionType = type
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        // iOS 7
//        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from), let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else{
//            return
//        }
//        let fromView = fromVC.view
//        let toView = toVC.view
        
        // iOS 8 之后才有
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from),
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
        
        var translation = containerView.frame.width
        var toViewTransform = CGAffineTransform.identity
        var fromViewTransform = CGAffineTransform.identity
        
        translation = (transitionType == .push ? translation : -translation)
        
        toViewTransform = CGAffineTransform(translationX: translation, y: 0)
        fromViewTransform = CGAffineTransform(translationX: -translation, y: 0)
        
        containerView.addSubview(toView)
        
        toView.transform = toViewTransform
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.transform = fromViewTransform
            toView.transform = CGAffineTransform.identity
        }, completion: { finished in
            // notice all back identity
            fromView.transform = CGAffineTransform.identity
            toView.transform = CGAffineTransform.identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}
