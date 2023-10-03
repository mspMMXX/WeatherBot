//
//  Message.swift
//  ChatBot
//
//  Created by Markus Platter on 26.09.23.
//

import Foundation

class Message: Identifiable {
    
    var name: String
    var text: String
    
    /// Gibt an ob die Nachricht vom User ist oder nicht. Entscheidet im weiteren ob MessageViewCellUser oder MessageCellViewBot im ContentView verwendet wird
    var isFromUser: Bool
    
    init(name: String, text: String, isFromUser: Bool) {
        self.name = name
        self.text = text
        self.isFromUser = isFromUser
    }
}
