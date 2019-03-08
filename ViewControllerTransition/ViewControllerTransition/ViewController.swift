//
//  ViewController.swift
//  ViewControllerTransition
//
//  Created by 李杰 on 2019/3/7.
//  Copyright © 2019 李杰. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let titles = ["push pop no interactive",
                  "push pop with interactive",
                  "present dismiss"]
    let viewControllers = [LJPopViewController(), LJPopGestureViewController(), LJPresentViewController()]
    
    let modalDelegate = LJModalTransitionDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        navigationItem.title = "Home"
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "ViewControllerCells"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = titles[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let viewController = viewControllers[indexPath.row]
        if indexPath.row == 2 {
            viewController.transitioningDelegate = modalDelegate
            viewController.modalPresentationStyle = .custom
            self.present(viewController, animated: true, completion: nil)
        } else {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
