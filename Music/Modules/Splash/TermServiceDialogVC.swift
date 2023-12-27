//
//  TermServiceDialogVC.swift
//  Music
//
//  Created by apple on 2023/12/27.
//

import UIKit

public class TermServiceDialogVC: BaseViewController, QMUIModalPresentationContentViewControllerProtocol {
    
    public typealias Completion = (Bool) -> Void
    
    public var agreeBtnClick: Completion?
    
    // modal 弹出控制器
    private lazy var _modalController: QMUIModalPresentationViewController = {
        
        let modalController = QMUIModalPresentationViewController()
        
        modalController.animationStyle = .fade
        // 边距
        modalController.contentViewMargins = UIEdgeInsets(top: PADDING_LARGE2, left: PADDING_LARGE2, bottom: PADDING_LARGE2, right: PADDING_LARGE2)
        
        // 点击外部不隐藏
        modalController.isModal = true
        
        // 设置要现实的内容空间
        modalController.contentViewController = self
        
        return modalController
    }()

    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func _agreeAction(_ sender: Any) {
        DefaultsPreference.setAcceptTermsServiceAgreement(true)
        self.hide()
        self.agreeBtnClick?(true)
    }
    
    @IBAction func _exitAction(_ sender: Any) {
        exit(0)
    }
}


// MARK: - action
extension TermServiceDialogVC {
    
}

// MARK: - show or hide
extension TermServiceDialogVC {
    
    public func show(completion: Completion? = nil) {
        self._modalController.showWith(animated: true, completion: completion)
    }
    
    public func hide(completion: Completion? = nil) {
        self._modalController.hideWith(animated: true, completion: completion)
    }
}
