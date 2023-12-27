//
//  GuideViewController.swift
//  Music
//
//  Created by apple on 2023/12/27.
//

import UIKit
import SnapKit

public class GuideViewController: BaseViewController {

    
    private lazy var _bannerView: SDCycleScrollView = {
        let imageGroup = [R.image.guide1.name, R.image.guide2.name, R.image.guide3.name, R.image.guide4.name, R.image.guide5.name]
        guard let bannerView = SDCycleScrollView(frame: CGRect.zero, imageNamesGroup: imageGroup) else {
            return SDCycleScrollView(frame: CGRect.zero)
        }
        bannerView.backgroundColor = .white
        bannerView.pageDotColor = .lightGray
        bannerView.currentPageDotColor = R.color.color_primary()
        return bannerView
    }()
    
    @IBOutlet weak var _bannerContainer: UIView!
    
    
   public override func viewDidLoad() {
        super.viewDidLoad()
       
       _loadSubView()
       
    }

    @IBAction func _loginOrRegister(_ sender: Any) {
        
        
    }
    
    
    @IBAction func _tryNowAction(_ sender: Any) {
        
        
    }
    
    
    

}

// MARK: - private
extension GuideViewController {
    
    private func _loadSubView() {
        self._bannerContainer.addSubview(self._bannerView)
        
        self._bannerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

