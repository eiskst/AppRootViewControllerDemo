//
//  ViewController.swift
//  AppRootViewControllerDemo
//
//  Created by Eisuke Sato on 2018/03/21.
//  Copyright © 2018年 eiskst. All rights reserved.
//

import UIKit

class AppRootViewController: UIViewController {

    var current: UIViewController
    
    init() {
        current = SplashViewController.instantiate()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChildViewController(current)
        view.addSubview(current.view)
        current.didMove(toParentViewController: self)
    }
    
    func showTop() {
        let new = TopViewController.instantiate()
        addChildViewController(new)
        view.addSubview(new.view)
        new.didMove(toParentViewController: self)
        
        current.willMove(toParentViewController: nil)
        current.view.removeFromSuperview()
        current.removeFromParentViewController()
        
        current = new
    }
    
    func switchToTop() {
        animateFadeTransition(to: TopViewController.instantiate())
    }
    
    func switchToMain() {
        animateFadeTransition(to: MainViewController.instantiate())
    }
    
    private func animateFadeTransition(to new: UIViewController, completion: (() -> Void)? = nil) {
        current.willMove(toParentViewController: nil)
        addChildViewController(new)
        transition(from: current, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {
            
        }) { completed in
            self.current.removeFromParentViewController()
            new.didMove(toParentViewController: self)
            self.current = new
            completion?()
        }
    }
}

