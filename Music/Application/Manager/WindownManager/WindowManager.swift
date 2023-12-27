//
//  WindowManager.swift
//  Music
//
//  Created by apple on 2023/12/26.
//

import Foundation
import UIKit

// TODO: 待优化

public enum WindowType {
    
    case main
    case alert
    case update
    
    public func windowLevel() -> CGFloat {
        switch self {
        case .alert:
            return UIWindow.Level.alert.rawValue
        case .update:
            return UIWindow.Level.alert.rawValue + 1.0
        default:
            return UIWindow.Level.normal.rawValue
        }
    }
}


public class WindowManager {
    
    var currentWindow: WindowProduct?
    
    var mainWindow: WindowProduct?
    
    private var windows = [UIWindow]()
    
    public static let manager = WindowManager()
    
    private init() {}
    
}

// MARK: public
extension WindowManager {
    
    public func show(with type: WindowType, rootVC: UIViewController, completion: Completion? = nil) {
        
        let window = WindowFacotry.createWindow(with: type, rootVC: rootVC)
        
        switch type {
        case .main:
            if let main = self.mainWindow  {
                main.dismiss(animation: true) {
                    self.mainWindow = nil
                    completion?()
                }
                
            }
            self.mainWindow = window
//            AppDelegate.shared.window = self.mainWindow as? UIWindow

        default:
            if let current = self.currentWindow {
                current.dismiss(animation: true, completion)
                self.currentWindow = nil
            }
            self.currentWindow = window
        }
        
        
        window.show(animation: true) {
            // 重新设置原来的 keywindow 永远是mainwindow
//            UIApplication.shared.windows.first?.makeKeyAndVisible()
//                        AppDelegate.shared.window = self.mainWindow as? UIWindow

            for w in UIApplication.shared.windows {
                print(String(describing: w))
            }
            
            completion?()
        }

        
        
    }
    
    
    public func dismiss(_ completion: Completion? = nil) {
        if let currentWindow = self.currentWindow {
            currentWindow.dismiss(animation: true, completion)
        }
        self.currentWindow = nil
    }
}

extension WindowManager {
    
    // 获取keywindow
    public static func keywindow() -> UIWindow? {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
            return keyWindow
        }
        return nil
    }
}
