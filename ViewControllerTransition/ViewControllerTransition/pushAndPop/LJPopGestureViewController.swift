//
//  LJPopGestureViewController.swift
//  ViewControllerTransition
//
//  Created by 李杰 on 2019/3/8.
//  Copyright © 2019 李杰. All rights reserved.
//

import UIKit

class LJPopGestureViewController: UIViewController {
    
    private let edgePanGesture = UIScreenEdgePanGestureRecognizer()
    var navigationDelegate: LJNavigationDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.brown
        navigationItem.title = "POP interactive"
        edgePanGesture.edges = .left
        edgePanGesture.addTarget(self, action: #selector(handleEdgePanGesture(gesture:)))
        view.addGestureRecognizer(edgePanGesture)
    }
    
    @objc func handleEdgePanGesture(gesture: UIScreenEdgePanGestureRecognizer) {
        let translationX = abs(gesture.translation(in: view).x)
        let base = view.frame.width
        let percent = translationX / base
        
        switch gesture.state {
        case .began:
            navigationDelegate = navigationController?.delegate as? LJNavigationDelegate
            navigationDelegate?.interactive = true
            navigationController?.popViewController(animated: true)
        case .changed:
            navigationDelegate?.interactionTransition.update(percent)
        case .cancelled, .ended:
            if percent > 1/2 {
                navigationDelegate?.interactionTransition.finish()
            } else {
                navigationDelegate?.interactionTransition.cancel()
            }
            navigationDelegate?.interactive = false
        default:
            break
        }
    }
    
    

}
