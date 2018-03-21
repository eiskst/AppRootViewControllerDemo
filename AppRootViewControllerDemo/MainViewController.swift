//
//  MainViewController.swift
//  AppRootViewControllerDemo
//
//  Created by Eisuke Sato on 2018/03/21.
//  Copyright © 2018年 eiskst. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, Storyboardable {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        AppDelegate.shared.rootViewController.switchToTop()
    }
}
