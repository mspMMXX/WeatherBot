//
//  Message.swift
//  ChatBot
//
//  Created by Markus Platter on 26.09.23.
//

import Foundation

class Message: Identifiable {
    
    var author: String
    var text: String
    
    /// Gibt an ob die Nachricht vom User ist oder nicht. Entscheidet im weiteren ob MessageViewCellUser oder MessageCellViewBot im ContentView verwendet wird
    var isFromUser: Bool
    
    init(author: String, text: String, isFromUser: Bool) {
        self.author = author
        self.text = text
        self.isFromUser = isFromUser
    }
}
