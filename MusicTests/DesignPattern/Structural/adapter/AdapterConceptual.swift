//
//  AdapterConceptual.swift
//  MusicTests
//
//  Created by apple on 2023/12/26.
//

import XCTest


/// The Target defines the domain-specific interface used by the client code.
class Target {
    func request() -> String {
        return "Target: The default target's behavior."
    }
}

/// The Adaptee contains some useful behavior, but its interface is incompatible
/// with the existing client code. The Adaptee needs some adaptation before the
/// client code can use it.
class Adaptee {
    public func specificRequest() -> String {
        return ".eetpadA eht fo roivaheb laicepS"
    }
}

class Adapter: Target {
    private var adaptee: Adaptee
    
    init(adaptee: Adaptee) {
        self.adaptee = adaptee
    }
    
    override func request() -> String {
        return "Adapter: (TRANSLATED) " + adaptee.specificRequest().reversed()
    }
}


/// The client code supports all classes that follow the Target interface.
class AdapterConceptualClient {
    // ...
    static func someClientCode(target: Target) {
        print(target.request())
    }
    // ...
}


final class AdapterConceptual: XCTestCase {
    
    func testExample() throws {
        print("Client: I can work just fine with the Target objects:")
        AdapterConceptualClient.someClientCode(target: Target())
        
        let adaptee = Adaptee()
        print("Client: The Adaptee class has a weird interface. See, I don't understand it:")
        print("Adaptee: " + adaptee.specificRequest())
        
        print("Client: But I can work with it via the Adapter:")
        AdapterConceptualClient.someClientCode(target: Adapter(adaptee: adaptee))
    }
    
}
