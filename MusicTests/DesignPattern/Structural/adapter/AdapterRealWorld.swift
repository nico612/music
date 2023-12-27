//
//  AdapterRealWorld.swift
//  MusicTests
//
//  Created by apple on 2023/12/26.
//

import XCTest


final class AdapterRealWorld: XCTestCase {

    func testAdapterRealWorld() {

           print("Starting an authorization via Facebook")
           startAuthorization(with: FacebookAuthSDK())

           print("Starting an authorization via Twitter.")
           startAuthorization(with: TwitterAuthSDK())
       }

       func startAuthorization(with service: AuthService) {

           /// The current top view controller of the app
           let topViewController = UIViewController()

           service.presentAuthFlow(from: topViewController)
       }

}


protocol AuthService {

    func presentAuthFlow(from viewController: UIViewController)
}


class FacebookAuthSDK {

    func presentAuthFlow(from viewController: UIViewController) {
        /// Call SDK methods and pass a view controller
        print("Facebook WebView has been shown.")
    }
}

extension FacebookAuthSDK: AuthService {
    /// This extension just tells a compiler that both SDKs have the same
    /// interface.
}

class TwitterAuthSDK {

    func startAuthorization(with viewController: UIViewController) {
        /// Call SDK methods and pass a view controller
        print("Twitter WebView has been shown. Users will be happy :)")
    }
}


extension TwitterAuthSDK: AuthService {

    /// This is an adapter
    ///
    /// Yeah, we are able to not create another class and just extend an
    /// existing one

    func presentAuthFlow(from viewController: UIViewController) {
        print("The Adapter is called! Redirecting to the original method...")
        self.startAuthorization(with: viewController)
    }
}
