//
//  Conversation.swift
//  ChatBot
//
//  Created by Markus Platter on 26.09.23.
//

import Foundation

class Conversation: ObservableObject {
    
    /// Speichert alle Nachrichten vom Typ "Message" in einer Liste
    @Published var messageList = [Message]()
    
    /// Fügt eine neue Nachricht vom Typ "Message" zur "messageList" hinzu
    ///
    /// - Parameter message: Die Nachricht die hinzugefügt wird
    func addMessage(message: Message) {
        
        messageList.append(message)
    }
}
