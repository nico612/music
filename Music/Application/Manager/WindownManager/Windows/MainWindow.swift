//
//  MainWindow.swift
//  Music
//
//  Created by apple on 2023/12/26.
//

import UIKit

/// MainWindow 主要用于主要内容显示如：必须要登录的应用的登录界面，启动时的引导页面等
public class MainWindow: BaseWindow {
    
    public override func show(animation: Bool = true, _ completion: Completion? = nil) {
        self.isHidden = false
        self.makeKeyAndVisible()
        completion?()
    }
    
    public override func dismiss(animation: Bool = true, _ completion: Completion? = nil) {
        self.isHidden = true
        completion?()
    }
    
}



