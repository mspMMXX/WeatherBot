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
    var isFromUser: Bool
    var date: String
    
    init(name: String, text: String, isFromUser: Bool) {
        self.name = name
        self.text = text
        self.isFromUser = isFromUser
        
        let date = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "de_DE")
        dateFormatter.dateFormat = "EEEE, dd.MM.yyyy, HH:mm:ss"
        self.date = dateFormatter.string(from: date)
    }
}
