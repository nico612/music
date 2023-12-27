//
//  SingletonRealWorld.swift
//  MusicTests
//
//  Created by apple on 2023/12/26.
//

import XCTest

final class SingletonRealWorld: XCTestCase {
    
    func testSingletonRealWorld() {
        let listVC = MessageListVC()
        let chatVC = ChatVC()
        
        listVC.startReceiveMessages()
        chatVC.startReceiveMessages()

    }
    
}


class BaseVC: UIViewController, MessageSubscriber {
    
    func accept(new messages: [Message]) {
        /// handle new message in the base class
    }
    
    func accept(removed messages: [Message]) {
        /// hanlde removed message in the base class
    }
    
    
    func startReceiveMessages() {
        FriendsChatService.shared.add(subscriber: self)
    }
}


class MessageListVC: BaseVC {
    
    override func accept(new messages: [Message]) {
        print("MessagesListVC accepted 'new messages'")
    }
    
    override func accept(removed messages: [Message]) {
        print("MessagesListVC accepted 'removed messages'")
    }
    
    override func startReceiveMessages() {
        print("MessagesListVC starts receive messages")
        super.startReceiveMessages()
    }
}

class ChatVC: BaseVC {
    override func accept(new messages: [Message]) {
        print("ChatVC accepted 'new messages'")
        
    }
    
    override func accept(removed messages: [Message]) {
        print("ChatVC accepted 'removed messages'")
    }
    
    override func startReceiveMessages() {
        print("ChatVC starts receive messages")
        super.startReceiveMessages()
    }
}


protocol MessageService {
    
    func add(subscriber: MessageSubscriber)
}


protocol MessageSubscriber {
    func accept(new messages: [Message])
    func accept(removed messages: [Message])
}

struct Message {
    let id: Int
    let text: String
}


class FriendsChatService: MessageService {
    static let shared = FriendsChatService()
    
    private var subscribers = [MessageSubscriber]()
    
    func add(subscriber: MessageSubscriber) {
        subscribers.append(subscriber)
    }
    
    func startFetching() {
        let newMessages = [
            Message(id: 0, text: "Text0"),
            Message(id: 5, text: "Text5"),
            Message(id: 10, text: "Text10")
        ]
        
        let removedMessage = [Message(id: 1, text: "Text0")]
        
        // Send updated data to subscribers
        
    }
}

private extension FriendsChatService {
    func receiveNew(message: [Message]) {
        subscribers.forEach { item in
            item.accept(new: message)
        }
    }
    
    func receivedRemove(messages: [Message]) {
        subscribers.forEach { item in
            item.accept(removed: messages)
        }
    }
}
