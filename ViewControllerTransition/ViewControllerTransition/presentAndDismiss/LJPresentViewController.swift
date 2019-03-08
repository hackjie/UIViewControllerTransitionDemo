//
//  LJPresentViewController.swift
//  ViewControllerTransition
//
//  Created by 李杰 on 2019/3/8.
//  Copyright © 2019 李杰. All rights reserved.
//

import UIKit

class LJPresentViewController: UIViewController {

    lazy var dismissBtn: UIButton = {
        let btn = UIButton(frame: CGRect(x: 40, y: 100, width: 80, height: 40))
        btn.setTitle("dismiss", for: UIControl.State.normal)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(dismissVC), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        dismissBtn.addTarget(self, action: #selector(dismissVC), for: UIControl.Event.touchUpInside)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.view.addSubview(self.dismissBtn)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Present VC"
        view.backgroundColor = UIColor.blue
    }
    
    @objc func dismissVC() {
        UIView.animate(withDuration: 0.4, animations: {
            self.dismissBtn.removeFromSuperview()
        }) { _ in
            self.dismiss(animated: true, completion: nil)
        }
    }
}
