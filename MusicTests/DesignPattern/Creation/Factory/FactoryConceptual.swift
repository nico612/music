//
//  FactoryConcept.swift
//  MusicTests
//
//  Created by apple on 2023/12/26.
//

import XCTest
/**
 工厂方法是一种创建型设计模式， 解决了在不指定具体类的情况下创建产品对象的问题。
 
 工厂方法定义了一个方法， 且必须使用该方法代替通过直接调用构造函数来创建对象 （ new操作符） 的方式。 子类可重写该方法来更改将被创建的对象所属类。
 
 
 识别方法： 工厂方法可通过构建方法来识别， 它会创建具体类的对象， 但以抽象类型或接口的形式返回这些对象。
 
 概念示例
 本例说明了工厂方法设计模式的结构并重点回答了下面的问题：
 
 它由哪些类组成？
 这些类扮演了哪些角色？
 模式中的各个元素会以何种方式相互关联？
 在了解该模式的结构后， 你可以更容易地理解下面的基于真实世界的 Swift 应用案例。
 
 */



/// The Creator protocol declares the factory method that's supposed to return a
/// new object of a Product class. The Creator's subclasses usually provide the
/// implementation of this method.
protocol Creator {
    /// Note that the Creator may also provide some default implementation of
    /// the factory method.
    func factoryMethod() -> Product
    
    /// Also note that, despite its name, the Creator's primary responsibility
    /// is not creating products. Usually, it contains some core business logic
    /// that relies on Product objects, returned by the factory method.
    /// Subclasses can indirectly change that business logic by overriding the
    /// factory method and returning a different type of product from it.
    func someOperation() -> String
}

extension Creator {
    
    func someOperation() -> String {
        // Call the factory  method to create a Product object.
        let product = factoryMethod()
        
        // Now, use the product
        return "Creator: The same creator's code has just worked with " + product.operation()
    }
}

/// Concrete Creators override the factory method in order to change the
/// resulting product's type.
class ConcreteCreator1: Creator {
    
    /// Note that the signature of the method still uses the abstract product
    /// type, even though the concrete product is actually returned from the
    /// method. This way the Creator can stay independent of concrete product
    /// classes.
    func factoryMethod() -> Product {
        return ConcreteProduct1()
    }
    
}

class ConcreteCreator2: Creator {
    
    public func factoryMethod() -> Product {
        return ConcreteProduct2()
    }
}



/// The Product protocol declares the operations that all concrete products must
/// implement.
protocol Product {
    
    func operation() -> String
}


class ConcreteProduct1: Product {
    
    func operation() -> String {
        return "{Result of the ConcreteProduct1}"
    }
    
}

class ConcreteProduct2: Product {
    
    func operation() -> String {
        return "{Result of the ConcreteProduct1}"
    }
    
}

/// The client code works with an instance of a concrete creator, albeit through
/// its base protocol. As long as the client keeps working with the creator via
/// the base protocol, you can pass it any creator's subclass.
class Client {
    
    static func someClientCode(creator: Creator) {
        print("Client: I'm not aware of the creator's class, but it still works.\n"
              + creator.someOperation())
    }
}





final class FactoryConcept: XCTestCase {
    
        
    func testfactoryMethodConceptual() {
        /// The Application picks a creator's type depending on the
        /// configuration or environment.
        print("App: Launched with the ConcreteCreator1.")
        Client.someClientCode(creator: ConcreteCreator1())
        
        print("App: Launched with the ConcreteCreator2.")
        Client.someClientCode(creator: ConcreteCreator2())
    }
    
}
