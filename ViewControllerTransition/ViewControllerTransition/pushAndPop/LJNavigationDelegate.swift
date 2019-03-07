//
//  LJNavigationDelegate.swift
//  ViewControllerTransition
//
//  Created by 李杰 on 2019/3/7.
//  Copyright © 2019 李杰. All rights reserved.
//

import UIKit

class LJNavigationDelegate: NSObject, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return LJNavigationAnimator(type: operation)
    }
}
