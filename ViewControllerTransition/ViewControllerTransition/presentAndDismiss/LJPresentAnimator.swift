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
        return 0.3
    }
    
    /// 注意 present 和 dismiss 要分开处理
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        guard let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from), let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else{
            return
        }
        
        let fromView = fromVC.view
        let toView = toVC.view
        let duration = self.transitionDuration(using: transitionContext)
        
        if toVC.isBeingPresented {
            containerView.addSubview(toView!)
            let toViewWidth = containerView.frame.width * 2 / 3
            let toViewHeight = containerView.frame.height * 2 / 3
            toView?.center = containerView.center
            toView?.bounds = CGRect(x: 0, y: 0, width: 1, height: toViewHeight)
            
            UIView.animate(withDuration: duration,
                           delay: 0,
                           options: .curveEaseInOut,
                           animations: {
                toView?.bounds = CGRect(x: 0, y: 0, width: toViewWidth, height: toViewHeight)
            }, completion: {_ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        }
        
        //Dismissal 转场中不要将 toView 添加到 containerView
        if fromVC.isBeingDismissed {
            let fromViewHeight = fromView?.frame.height
            UIView.animate(withDuration: duration, animations: {
                fromView?.bounds = CGRect(x: 0, y: 0, width: 1, height: fromViewHeight!)
            }, completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            })
        }
    }
}
