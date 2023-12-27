//
//  ArrayQueue.swift
//  Music
//
//  Created by apple on 2023/12/27.
//

import Foundation


protocol Queue {
    
    associatedtype Element
    
    var isEmpty: Bool { get }
    
    mutating func enqueue(_ element: Element)
    
    mutating func dequeue() -> Element?
    
    func peek() -> Element?
    
    var count: Int { get }
}



/// 基于 Array的队列实现
/// Complexity: O(*n*), 因此不适合大量数据操作的场景
struct ArrayQueue<T>: Queue {
    
    typealias Element = T
    
    private var elements: [T] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    /// 入队
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    /// 出队
    mutating func dequeue() -> T? {
        return isEmpty ? nil : elements.removeFirst()
    }
    
    /// 返回队列头部的元素，不会将该元素移出队列。
    func peek() -> T? {
        return elements.first
    }
    
}
