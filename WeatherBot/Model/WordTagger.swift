//
//  VerbTagger.swift
//  ChatBot
//
//  Created by Markus Platter on 29.09.23.
//

import Foundation
import NaturalLanguage

class WordTagger {
    
    /// Ermittelt die Tags nach einem eingegebenen Text auf Basis eines festgelegten Schemas
    ///
    /// - Parameter text: Nimmt den zu durchsuchenden Text entgegen
    /// - Parameter tagScheme: Legt das Schema zur ermittlung der Tags fest
    /// - Returns: Ein Array von Tupeln, bestehend aus einem Wort und seinem dazugehörigen Tag
    private func tags(from text: String, tagScheme: NLTagScheme) -> [(String, NLTag)] {

        var tags: [(String, NLTag)] = []
        let tagger = NLTagger(tagSchemes: [tagScheme])
        tagger.setLanguage(.german, range: text.startIndex..<text.endIndex)
        tagger.string = text

        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: tagScheme, options: [.omitPunctuation, .omitWhitespace]) { tag, tokenRange in
            if let tag = tag, tag == .placeName {
                print("\(text[tokenRange]): \(tag.rawValue)")
                tags.append((String(text[tokenRange]), tag))
            }
            return true
        }
        return tags
    }
    
    /// Ruft die func tags auf und ermittelt die gefundenen Standorte und den passenden Tag aus dem text. Filtert anschließend die Standorte von den Tags 
    ///
    /// - Parameter text: Nimmt den Text entegegen der an die func tags übergeben wird
    /// - Returns: Ein Array von Standorte vom Typ "String"
    func getLocation(from text: String) -> [String] {
        let tags = tags(from: text, tagScheme: .nameTypeOrLexicalClass)
        let locations = tags.map { $0.0 }
        var locationList: [String] = []

        for eachtLocation in locations {
            locationList.append(eachtLocation)
        }
        return locationList
    }
}
