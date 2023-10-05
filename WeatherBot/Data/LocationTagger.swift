//
//  VerbTagger.swift
//  ChatBot
//
//  Created by Markus Platter on 29.09.23.
//

import Foundation
import NaturalLanguage

class LocationTagger {
    
    /// Ermittelt die Tags nach einem eingegebenen Text auf Basis eines festgelegten Schemas
    ///
    /// - Parameter text: Nimmt den zu durchsuchenden Text entgegen
    /// - Parameter tagScheme: Legt das Schema zur ermittlung der Tags fest
    /// - Returns: Ein Array von Tupeln, bestehend aus einem Wort und seinem dazugehörigen Tag
    private func tags(from text: String, tagScheme: NLTagScheme) -> [(String, NLTag)] {
        
        var lastTagWasPlaceName = false
        var lastPlaceName = ""
        var tags: [(String, NLTag)] = []
        let tagger = NLTagger(tagSchemes: [tagScheme])
        tagger.setLanguage(.german, range: text.startIndex..<text.endIndex)
        tagger.string = text
        
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: tagScheme, options: [.omitPunctuation, .omitWhitespace]) { tag, tokenRange in
            
            if let tag = tag, tag == .placeName {
                
                if lastTagWasPlaceName {
                    
                    let combinedPlaceName = "\(lastPlaceName) \(text[tokenRange])"
                    tags.append((combinedPlaceName, tag))
                    lastTagWasPlaceName = false
                } else {
                    
                    lastPlaceName = String(text[tokenRange])
                    lastTagWasPlaceName = true
                }
            } else {
                
                lastTagWasPlaceName = false
            }
            return true
        }
        if lastTagWasPlaceName {
            tags.append((lastPlaceName, .placeName))
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
