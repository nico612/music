//
//  AppDelegate.swift
//  Music
//
//  Created by apple on 2023/12/25.
//

import UIKit

@main
public class AppDelegate: UIResponder, UIApplicationDelegate {
    
    public var window: UIWindow?
    
    private var _isInit: Bool = false
    
    // 静态计算属性
    public class var shared: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }
    
    // 通知扩展信息
    public var notificationData:String?
    

    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 默认显示界面
        loadSplash()
       
                
        return true
    }
    
}

// MARK: - Private
extension AppDelegate {
    
    // 初始默认显示界面
    private func loadSplash() {
        
        let splash = SplashViewController(nib: R.nib.splashViewController)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = splash
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
    }
    
    /// 腾讯开元的偏好储存框架
    private func initMMKV() {
        MMKV.initialize(rootDir: nil)
    }
    
}


// MARK: - public
extension AppDelegate {
    
    // 跳转到引导页
    public func toGuid() {
        let guide = GuideViewController(nib: R.nib.guideViewController)
        setGuideController(guide)
    }
    
    // 初始化操作
    public func onInit() {
        if !_isInit {
            _isInit = true
            // 做一些初始化的相关操作，比如各种SDK, 各种配置等
        }
    }
    
    // to 广告页
    public func toAd() {
        
    }
    
    public func setGuideController(_ rootVC: UIViewController) {
        self.window?.rootViewController = rootVC
    }
}

// MARK: - 通知
extension AppDelegate: UNUserNotificationCenterDelegate {
    
    public func initNotification(_ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        
        // 苹果中，有两种通知，一种是远程通知(简单理解为苹果服务器发消息到应用)，一种是本地通知(应用中发送一个通知)
        // 集成了融云IM，相当于就集成了远程通知，但远程通知是付费开发者账号才能用的功能，也要在真机上测试
        // 使用 UNUserNotificationCenter 来管理通知
        let center = UNUserNotificationCenter.current()
        
        // 必须写代理，不然无法监听通知的接收与点击
        center.delegate = self
        
        center.requestAuthorization(options: [UNAuthorizationOptions.alert, UNAuthorizationOptions.sound, .badge]) { granted, error in
            if granted {
                print("AppDelegate initNotification notification granted")
            } else{
                print("AppDelegate initNotification notification not grant")
            }
        }
        
        //注册远程通知
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    
    
    /// 通知显示前调用
    /// 可以修改通知
    /// - Parameters:
    ///   - center: <#center description#>
    ///   - notification: <#notification description#>
    ///   - completionHandler: <#completionHandler description#>
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // 处理完成后一定要调用 completionHandler
        completionHandler([.alert, .sound, .badge])
    }
    
    
    /// 本地通知点击，不论应用是否冻结，都会调用
    /// - Parameters:
    ///   - center: <#center description#>
    ///   - response: <#response description#>
    ///   - completionHandler: <#completionHandler description#>
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if let extra = response.notification.request.content.userInfo[EXTRA] as? String {
            
            // 扩展通知
            notificationData = extra
            
            
        }
    }
}

