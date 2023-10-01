//
//  Message.swift
//  ChatBot
//
//  Created by Markus Platter on 26.09.23.
//

import Foundation

class Message: Identifiable {
    
    let botName: String = "Bot"
    var userName: String
    var text: String
    var isFromUser: Bool
    var date: String
    
    init(userName: String, text: String, isFromUser: Bool) {
        self.userName = userName
        self.text = text
        self.isFromUser = isFromUser
        
        let date = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "de_DE")
        dateFormatter.dateFormat = "EEEE, dd.MM.yyyy, HH:mm:ss"
        self.date = dateFormatter.string(from: date)
    }
}
