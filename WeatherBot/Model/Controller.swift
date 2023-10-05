//
//  Controller.swift
//  WeatherBot
//
//  Created by Markus Platter on 04.10.23.
//

import Foundation

class Controller {
    
    var text: String?
    var isFromUser: Bool?
    var isNext: Bool?
    
    init(text: String? = nil, isFromUser: Bool? = nil, isNext: Bool? = nil) {
        self.text = text
        self.isFromUser = isFromUser
        self.isNext = isNext
    }
    
    func getText() -> String {

        if let isUser = isFromUser {
            if isUser {
                isNext = true
                if let input = text {
                    return input
                }
            } else {
                return "error"
            }
        }
        return ""
    }
}
