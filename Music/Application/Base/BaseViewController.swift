//
//  NCBaseViewController.swift
//  Music
//
//  Created by apple on 2023/12/25.
//

import Foundation
import UIKit


public class BaseViewController: UIViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("销毁\(BaseViewController.self)")
    }
}

