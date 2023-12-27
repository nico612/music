//
//  CommonAlertViewController.swift
//  Music
//
//  Created by apple on 2023/12/27.
//

import UIKit

public class CommonAlertViewController: BaseAlertViewController {
    
    public typealias DismissBlock = () -> Void
    
    public var dismissBlock: DismissBlock?
    
    @IBOutlet weak var contentView: UIView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
}


extension CommonAlertViewController {
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if !self.isClickBgDismiss {
            return
        }
        
        let tapLocation = sender.location(in: self.view)
        // 判断点击是否在红色视图上
        if !contentView.frame.contains(tapLocation) {
            dismissBlock?()
        }
    }
    
    
}
