//
//  NSObjectProtocol+Extension.swift
//  fantasista-app
//
//  Created by 奥出泰葉 on 2018/02/10.
//  Copyright © 2018年 奥出泰葉. All rights reserved.
//

import Foundation
import UIKit

extension NSObjectProtocol {
    static var className: String {
        return String(describing: self)
    }
}

protocol Storyboardable: NSObjectProtocol {
    static var storyboardName: String { get }
    static func instantiate() -> Self
}

extension Storyboardable where Self: UIViewController {
    static var storyboardName: String {
        return String(className.prefix(className.count - "ViewController".count))
    }
    
    static func instantiate() -> Self {
        return UIStoryboard(name: storyboardName, bundle: Bundle(for: self)).instantiateInitialViewController() as! Self
    }
}

protocol Nibable: NSObjectProtocol {
    static var nibName: String { get }
    static var nib: UINib { get }
}

extension Nibable {
    static var nibName: String {
        return className
    }
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }
}

