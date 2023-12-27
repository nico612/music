//
//  DefalutPreference.swift
//  Music
//
//  Created by apple on 2023/12/27.
//

import Foundation


public class DefaultsPreference {
    
    // 隐私协议
    static let TERMS_SERVICE = "TERMS_SERVICE"
    
    /// 是否同意了用户条款
    /// - Parameter data: <#data description#>
    /// - Returns: <#description#>
    static func isAcceptTermsServiceAgreement() -> Bool {
        return UserDefaults.standard.bool(forKey: TERMS_SERVICE)
    }
    
    /// 设置同意了用户协议
    /// - Parameter data: <#data description#>
    static func setAcceptTermsServiceAgreement(_ data:Bool) {
        UserDefaults.standard.set(data, forKey: TERMS_SERVICE)
    }
    
}
