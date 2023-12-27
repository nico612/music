//
//  FactoryReal.swift
//  MusicTests
//
//  Created by apple on 2023/12/26.
//

import XCTest

// 真实使用示例



final class FactoryReal: XCTestCase {
    
    func testFactoryMethodRealWorld() throws {
        
        let info = "Very important info of the presentation"
        
        let clientCode = ClientCode()
        
        clientCode.present(info: info, with: WifiFactory())
        
        clientCode.present(info: info, with: BluetoothFactory())
    }
    
}


protocol ProjectFactory {
    
    func createProject() -> Projector
    
    func syncedProjector(with projector: Projector) -> Projector
}

extension ProjectFactory {
    
    /// Base implementation of ProjectorFactory
    
    
    func syncedProjector(with projector: Projector) -> Projector {
        
        /// Every instance creates an own projector
        let newProjector = createProject()
        
        // sync projectors
        newProjector.sync(with: projector)
        
        return newProjector
    }
    
}


class WifiFactory: ProjectFactory {
    
    func createProject() -> Projector {
        return WifiProjector()
    }
}


class BluetoothFactory: ProjectFactory {
    
    func createProject() -> Projector {
        return BluetoothProjector()
    }
}



protocol Projector {
    
    /// Abstract projector interface
    
    var currentPage: Int { get }
    
    func present(info: String)
    
    func sync(with projector: Projector)
    
    func update(with page: Int)
    
}

extension Projector {
    
    func sync(with projector: Projector) {
        
        projector.update(with: currentPage)
    }
}

class WifiProjector: Projector {
    
    var currentPage: Int = 0
    
    func present(info: String) {
        print("Info is presented over Wifi: \(info)")
    }
    
    func update(with page: Int) {
        currentPage = page
    }
    
}

class BluetoothProjector: Projector {
    
    var currentPage: Int = 0
    
    func present(info: String) {
        print("Info is presented over Bluetooth: \(info)")
    }
    
    func update(with page: Int) {
        /// ... scroll page via Bluetooth connection
        currentPage = page
        
    }
}


private class ClientCode {
    
    private var currentProjector: Projector?
    
    func present(info: String, with factory: ProjectFactory) {
        
        /// Check wheater a client code already present smth...
        guard let projector = currentProjector else {
            /// 'currentProjector' variable is nil. Create a new projector and
            /// start presentation.
            
            let projector = factory.createProject()
            projector.present(info: info)
            self.currentProjector = projector
            return
        }
        
        /// Client code already has a projector. Let's sync pages of the old
        /// projector with a new one.
        self.currentProjector = factory.syncedProjector(with: projector)
        self.currentProjector?.present(info: info)
    }
    
    
}
