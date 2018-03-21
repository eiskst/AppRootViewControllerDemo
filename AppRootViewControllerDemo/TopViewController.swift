//
//  TopViewController.swift
//  AppRootViewControllerDemo
//
//  Created by Eisuke Sato on 2018/03/21.
//  Copyright © 2018年 eiskst. All rights reserved.
//

import UIKit

final class TopViewController: UIViewController, Storyboardable {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        AppDelegate.shared.rootViewController.switchToMain()
    }
}
