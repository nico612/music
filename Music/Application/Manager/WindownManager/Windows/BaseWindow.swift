//
//  BaseWindow.swift
//  Music
//
//  Created by apple on 2023/12/27.
//

import UIKit

public class BaseWindow: UIWindow, WindowProduct {
    
    public var type: WindowType
    
    public required init(type: WindowType, frame: CGRect, rootVC: UIViewController) {
        
        self.type = type
        
        super.init(frame: frame)
        
        switch type {
        case .main:
            self.backgroundColor = R.color.color_white()
        default:
            self.backgroundColor = R.color.color_block_05()
        }
        self.windowLevel = UIWindow.Level(type.windowLevel())
        self.rootViewController = rootVC
    }
    
    internal  let animationDuration = 0.2
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("\(String(describing: self)) delloc")
    }
    
    
    public func show(animation: Bool = true,  _ completion: Completion? = nil) {
        
        DispatchQueue.main.async  {
            self.isHidden = false
            self.alpha = 0.8

            UIView.animate(withDuration: self.animationDuration, delay: 0.0, options: .curveEaseIn, animations: {
                self.alpha = 1.0

            }) { _ in
                self.makeKeyAndVisible()
                completion?()
            }
        }
       
    }
    
    
    public func dismiss(animation: Bool = true, _ completion: Completion? = nil) {
        
        DispatchQueue.main.async {
            self.alpha = 1.0
            UIView.animate(withDuration: self.animationDuration) {
                self.alpha = 0.3
            } completion: { _ in
                self.isHidden = true
                completion?()
            }
        }
    }
    
}


