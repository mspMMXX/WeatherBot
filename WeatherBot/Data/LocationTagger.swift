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
    func getLocation(from text: String, tagScheme: NLTagScheme) -> [String] {
        
        var lastTagWasPlaceName = false
        var lastPlaceName = ""
        var locationNames: [String] = []
        let tagger = NLTagger(tagSchemes: [tagScheme])
        tagger.setLanguage(.german, range: text.startIndex..<text.endIndex)
        tagger.string = text.lowercased().capitalized
        
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: tagScheme, options: [.omitPunctuation, .omitWhitespace]) { tag, tokenRange in
            
            if let tag = tag, tag == .placeName {
                
                if lastTagWasPlaceName {
                    
                    let combinedPlaceName = "\(lastPlaceName) \(text[tokenRange])"
                    if combinedPlaceName.lowercased() != "ist" {
                        locationNames.append(combinedPlaceName)
                    }
                    lastTagWasPlaceName = false
                } else {
                    
                    lastPlaceName = String(text[tokenRange])
                    if lastPlaceName.lowercased() != "ist" {
                        lastTagWasPlaceName = true
                    }
                }
            } else {
                
                lastTagWasPlaceName = false
            }
            return true
        }
        if lastTagWasPlaceName {
                locationNames.append(lastPlaceName)
        }
        return locationNames
    }
}
