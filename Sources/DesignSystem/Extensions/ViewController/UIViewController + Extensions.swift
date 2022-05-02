//
//  File.swift
//  
//
//  Created by Арман Чархчян on 02.05.2022.
//

import Foundation

extension UIViewController {
    var topBarHeight: CGFloat {
        return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) + (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
    var buttonBarHeight: CGFloat {
        return self.tabBarController?.tabBar.frame.height ?? 0.0
    }
}
