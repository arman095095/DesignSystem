//
//  File.swift
//  
//
//  Created by Арман Чархчян on 02.05.2022.
//

import UIKit

extension UIViewController {
    public var topBarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) + (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
    public var buttonBarHeight: CGFloat {
        return self.tabBarController?.tabBar.frame.height ?? 0.0
    }
}
