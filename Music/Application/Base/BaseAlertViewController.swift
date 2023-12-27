//
//  BaseAlertViewController.swift
//  Music
//
//  Created by apple on 2023/12/27.
//

import UIKit

protocol AlertControllerProtocol {
    
    var isClickBgDismiss: Bool { get }
}


public class BaseAlertViewController: UIViewController, AlertControllerProtocol {

    public var isClickBgDismiss: Bool {
        let tableVIew =  UITableView()
        
        return true
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    deinit {
        print("\(String(describing: self)) delloc")
    }
}
