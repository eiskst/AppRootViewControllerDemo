//
//  SplashViewController.swift
//  AppRootViewControllerDemo
//
//  Created by Eisuke Sato on 2018/03/21.
//  Copyright © 2018年 eiskst. All rights reserved.
//

import UIKit

final class SplashViewController: UIViewController, Storyboardable {

    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeServiceCall()
    }
    
    func makeServiceCall() {
        indicatorView.startAnimating()
        check { (isLogin) in
            self.indicatorView.stopAnimating()
            if isLogin {
                DispatchQueue.main.async {
                    AppDelegate.shared.rootViewController.switchToMain()
                }
            } else {
                DispatchQueue.main.async {
                    AppDelegate.shared.rootViewController.switchToTop()
                }
            }
        }
    }
    
    func check(_ completion: @escaping (_ isLogin: Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(false)
        }
    }

}
