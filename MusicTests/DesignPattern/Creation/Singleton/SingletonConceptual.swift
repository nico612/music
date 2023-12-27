//
//  SingletonConceptual.swift
//  MusicTests
//
//  Created by apple on 2023/12/26.
//

import XCTest


class Singleton {
    
    static var shared: Singleton = {
        let instance = Singleton()
        // ... config the instance
        return instance
    }()
    
    private init() {}
    
    func someBusinessLogic() -> String {
        //...
        return "Result of the 'someBusinessLogic' call"
    }
}

extension Singleton: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}

class SingletonConceptualClient {
    
    
    static func someClientCode() {
        let instance1 = Singleton.shared
        let instance2 = Singleton.shared
        
        if (instance1 === instance2) {
            print("Singleton works, both variables contain the same instance.")
        } else {
            print("Singleton failed, variables contain different instances.")
        }
    }
}


final class SingletonConceptual: XCTestCase {

    func testExample() throws {
        SingletonConceptualClient.someClientCode()
    }

  

}
