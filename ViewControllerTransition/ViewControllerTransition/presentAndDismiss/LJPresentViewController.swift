//
//  LJPresentViewController.swift
//  ViewControllerTransition
//
//  Created by 李杰 on 2019/3/8.
//  Copyright © 2019 李杰. All rights reserved.
//

import UIKit

class LJPresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Present VC"
        view.backgroundColor = UIColor.blue
        
        let dismissBtn = UIButton(frame: CGRect(x: 40, y: 100, width: 80, height: 40))
        dismissBtn.setTitle("dismiss", for: UIControl.State.normal)
        dismissBtn.backgroundColor = UIColor.red
        dismissBtn.addTarget(self, action: #selector(dismissVC), for: UIControl.Event.touchUpInside)
        view.addSubview(dismissBtn)
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
}
