//
//  VerbTagger.swift
//  ChatBot
//
//  Created by Markus Platter on 29.09.23.
//

import Foundation
import NaturalLanguage

class LocationTagger {
    
    /// Ermittelt den Tag (Ortsnamen) nach einem eingegebenen Text auf Basis eines festgelegten Schemas
    ///
    /// - Parameter text: Nimmt den zu durchsuchenden Text entgegen
    /// - Returns: Ein String, bestehend aus einem Ortsnamen
    func getLocation(from text: String) -> String {
        
        var lastTagWasLocationName = false
        var lastLocationName = ""
        var locationName: String = ""
        let tagger = NLTagger(tagSchemes: [.nameType])
        tagger.setLanguage(.german, range: text.startIndex..<text.endIndex)
        tagger.string = text.lowercased().capitalized
        
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .nameType, options: [.omitPunctuation, .omitWhitespace]) { tag, tokenRange in
            
            if tag == .placeName {
                
                if lastTagWasLocationName {
                    
                    let combinedPlaceName = "\(lastLocationName) \(text[tokenRange])"
                    if combinedPlaceName.lowercased() != "ist" {
                        locationName = combinedPlaceName
                    }
                    lastTagWasLocationName = false
                } else {
                    
                    lastLocationName = String(text[tokenRange])
                    if lastLocationName.lowercased() != "ist" {
                        lastTagWasLocationName = true
                    }
                }
            } else {
                
                lastTagWasLocationName = false
            }
            return true
        }
        if lastTagWasLocationName {
                locationName = lastLocationName
        }
        return locationName
    }
}
