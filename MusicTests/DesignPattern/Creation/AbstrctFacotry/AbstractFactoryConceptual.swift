//
//  AbstrctFacotry.swift
//  MusicTests
//
//  Created by apple on 2023/12/26.
//

import XCTest
/**
 
 抽象工厂是一种创建型设计模式， 它能创建一系列相关的对象， 而无需指定其具体类。

 抽象工厂定义了用于创建不同产品的接口， 但将实际的创建工作留给了具体工厂类。 每个工厂类型都对应一个特定的产品变体。

 在创建产品时， 客户端代码调用的是工厂对象的构建方法， 而不是直接调用构造函数 （ new操作符）。 由于一个工厂对应一种产品变体， 因此它创建的所有产品都可相互兼容。

 客户端代码仅通过其抽象接口与工厂和产品进行交互。 该接口允许同一客户端代码与不同产品进行交互。 你只需创建一个具体工厂类并将其传递给客户端代码即可。
 
 使用示例： 抽象工厂模式在 Swift 代码中很常见。 许多框架和程序库会将它作为扩展和自定义其标准组件的一种方式。

 识别方法： 我们可以通过方法来识别该模式——其会返回一个工厂对象。 接下来， 工厂将被用于创建特定的子组件。
 */


protocol AbstractFactory {
    
    func createProductA() -> AbstractProductA
    func createProductB() -> AbstractProductB
}

// 抽象工厂实现类
class ConcreateFactory1: AbstractFactory {
    
    func createProductA() -> AbstractProductA {
         return ConcreateProductA1()
    }
    
    func createProductB() -> AbstractProductB {
        return ConcreteProductB1()
    }
}


/// Each Concrete Factory has a corresponding product variant.
class ConcreteFactory2: AbstractFactory {

    func createProductA() -> AbstractProductA {
        return ConcreteProductA2()
    }

    func createProductB() -> AbstractProductB {
        return ConcreteProductB2()
    }
}


// ProductA 协议, 定义 ProductA 的功能
protocol AbstractProductA {
    func usefulFunctionA() -> String
}


// 创建 ProductA 工厂 ProductA1
class ConcreateProductA1: AbstractProductA {
    
    func usefulFunctionA() -> String {
        return "The result of the product A1"
    }
    
}

// 创建 ProductA 工厂 ProductA2
class ConcreteProductA2: AbstractProductA {
    func usefulFunctionA() -> String {
        return "The result of the product A2"
    }
}



// ProductB 协议 定义产品 B 的功能
protocol AbstractProductB {
    /// Product B is able to do its own thing...
      func usefulFunctionB() -> String
    
    /// ...but it also can collaborate with the ProductA.
      ///
      /// The Abstract Factory makes sure that all products it creates are of the
      /// same variant and thus, compatible.
      func anotherUsefulFunctionB(collaborator: AbstractProductA) -> String
}


// 创建 ProductB 工厂 ProductB1
class ConcreteProductB1: AbstractProductB {
    
    func usefulFunctionB() -> String {
        return "The result of the product B1."
    }
    
    func anotherUsefulFunctionB(collaborator: AbstractProductA) -> String {
        let result = collaborator.usefulFunctionA()
        return "The result of the B1 collaborating with the (\(result))"
    }
}

class ConcreteProductB2: AbstractProductB {
    
    func usefulFunctionB() -> String {
        return "The result of the product B2."
    }
    
    func anotherUsefulFunctionB(collaborator: AbstractProductA) -> String {
        let result = collaborator.usefulFunctionA()
        return "The result of the B2 collaborating with the (\(result))"
    }
    
}

/// The client code works with factories and products only through abstract
/// types: AbstractFactory and AbstractProduct. This lets you pass any factory
/// or product subclass to the client code without breaking it.
class AbstractFacotryClient {
    
    static func someClientCode(facotry: AbstractFactory) {
        let productA = facotry.createProductA()
        let productB = facotry.createProductB()
        print(productB.usefulFunctionB())
        print(productB.anotherUsefulFunctionB(collaborator: productA))

    }
}


final class AbstractFactoryConceptual: XCTestCase {

    
    func testExample() throws {
        
        // 创建产品 A1 和 B1
        print("Client: Testing client code with the first factory type:")
        AbstractFacotryClient.someClientCode(facotry: ConcreateFactory1())
        
        // 创建产品 A2 和 B2
        print("Client: Testing the same client code with the second factory type:")
        AbstractFacotryClient.someClientCode(facotry: ConcreteFactory2())

    }

}


