//
//  WindowFacotry.swift
//  Music
//
//  Created by apple on 2023/12/26.
//

import Foundation
import UIKit



public typealias Completion = () -> Void

/// Window创建工厂
public protocol WindowCreator {
    
    static func createWindow(with type: WindowType, rootVC: UIViewController) -> WindowProduct
    
}

public class WindowFacotry: WindowCreator {
    
    public static func createWindow(with type: WindowType, rootVC: UIViewController) -> WindowProduct {
        switch type {
        case .main:
            let main = MainWindow(type: type, frame: UIScreen.main.bounds, rootVC: rootVC)
            AppDelegate.shared.window = main
            return main
        case .alert:
            return AlertWindow(type: type, frame: UIScreen.main.bounds, rootVC: rootVC)
        case .update:
            return AlertWindow(type: type, frame: UIScreen.main.bounds, rootVC: rootVC)
        }
    }
}


public protocol WindowProduct {
    
    
    var type: WindowType { get }
        
    init(type: WindowType,  frame: CGRect, rootVC: UIViewController)
    
    func show(animation: Bool, _ completion: Completion?)
    
    /// 只隐藏不做销毁，销毁需要在调用该方法后进行销毁
    func dismiss(animation: Bool, _ completion: Completion?)
}

