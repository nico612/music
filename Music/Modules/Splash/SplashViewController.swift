//
//  SplashViewController.swift
//  Music
//
//  Created by apple on 2023/12/27.
//

import UIKit
 

/// 初始启动页， 完全可以用 LanuchStoryboard 来替代
public class SplashViewController: UIViewController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        _loadSubView()
    }
    
}

extension SplashViewController {
    
    
    private func _loadSubView() {
        // 隐私协议
        if DefaultsPreference.isAcceptTermsServiceAgreement() {
            
        } else {
            showTermServerAgreementDialog()
        }
    }
    
    private func _prepareNext() {
        AppDelegate.shared.onInit()
        _next()
    }
    
    
    private func _next() {
        AppDelegate.shared.toAd()
    }
    
    
    private func showTermServerAgreementDialog() {
        
        let r = TermServiceDialogVC()
        r.show()
        
        r.agreeBtnClick = { [weak self]_ in
            guard let self = self else { return }
            self.showGuideView()
        }
    }
    
    // 显示引导页
    private func showGuideView() {
        
        AppDelegate.shared.toGuid()
    }
}
