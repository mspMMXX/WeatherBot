//
//  BotResponse.swift
//  ChatBot
//
//  Created by Markus Platter on 28.09.23.
//

import Foundation
import NaturalLanguage

class BotResponse {
            
    /*func botAnswer(keyWord: String) -> String {
        switch keyWord {
        case "Wie": return BotResponseWie(rawValue: keyWord)?.rawValue ?? "Für weitere Informationen, lesen Sie bitte das Buch 'Licht und Belichtung in der Fotografie' von Reinhard Merz und Karl Stechl."
        case "Was": return BotResponseWas(rawValue: keyWord)?.rawValue ?? "Für weitere Informationen, lesen Sie bitte das Buch 'Licht und Belichtung in der Fotografie' von Reinhard Merz und Karl Stechl."
        case "Wann": return BotResponseWann(rawValue: keyWord)?.rawValue ?? "Für weitere Informationen, lesen Sie bitte das Buch 'Licht und Belichtung in der Fotografie' von Reinhard Merz und Karl Stechl."
        default: return "Ich verstehe die Frage nicht"
        }
    }*/
    
    func botAnswer(keyWord: String) -> String {
        return BotResponseWie(rawValue: keyWord)?.rawValue ?? "Für weitere Informationen, lesen Sie bitte das Buch 'Licht und Belichtung in der Fotografie' von Reinhard Merz und Karl Stechl."

    }
}
