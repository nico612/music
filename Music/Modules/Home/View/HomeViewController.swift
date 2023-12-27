//
//  HomeViewController.swift
//  Music
//
//  Created by apple on 2023/12/25.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var present: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = R.color.color_white()
    }

    @IBAction func presentAction(_ sender: Any) {
        
        let artVC =  CommonAlertViewController(nib: R.nib.commonAlertViewController)
        
        WindowManager.manager.show(with: .alert, rootVC: artVC)
        
        artVC.dismissBlock = {
            WindowManager.manager.dismiss()
        }
    }
    
}
