//
//  LJNavigationDelegate.swift
//  ViewControllerTransition
//
//  Created by 李杰 on 2019/3/7.
//  Copyright © 2019 李杰. All rights reserved.
//

import UIKit

class LJNavigationDelegate: NSObject, UINavigationControllerDelegate {
    
    var interactive = false
    let interactionTransition = UIPercentDrivenInteractiveTransition()
    
    /// 返回转场动画对象
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LJNavigationAnimator(type: operation)
    }
    
    /// 转场有交互的时候需要
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactive ? self.interactionTransition : nil
    }
}
