//
//  Conversation.swift
//  ChatBot
//
//  Created by Markus Platter on 26.09.23.
//

import Foundation

class Conversation: ObservableObject {
    
    @Published var messageList = [Message]()
    
    func addMessage(_ message: Message) {
        messageList.append(message)
    }
}
