//
//  VerbTagger.swift
//  ChatBot
//
//  Created by Markus Platter on 29.09.23.
//

import Foundation
import NaturalLanguage

class WordTagger {
    
    private func tags(from text: String, tagScheme: NLTagScheme) -> [(String, NLTag)] {

        var nouns: [(String, NLTag)] = []
        let tagger = NLTagger(tagSchemes: [tagScheme])
        tagger.setLanguage(.german, range: text.startIndex..<text.endIndex)
        tagger.string = text

        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: tagScheme, options: [.omitPunctuation, .omitWhitespace]) { tag, tokenRange in
            if let tag = tag, tag == .placeName {
                print("\(text[tokenRange]): \(tag.rawValue)")
                nouns.append((String(text[tokenRange]), tag))
            }
            return true
        }
        return nouns
    }
    
    // String Array - for citynames
    func getLocation(from text: String) -> [String] {
        let tags = tags(from: text, tagScheme: .nameTypeOrLexicalClass)
        let locations = tags.map { $0.0 }
        var locationList: [String] = []

        for eachtLocation in locations {
            locationList.append(eachtLocation)
        }
        return locationList
    }
    
    //String Array - for adjectives
    func getAdjectives(from text: String) -> [String] {
        let tags = tags(from: text, tagScheme: .lexicalClass)
        let adjectives = tags.map { $0.0 }
        var adjectivList: [String] = []
        
        for eachAdjectiv in adjectives {
            adjectivList.append(eachAdjectiv)
        }
        return adjectivList
    }
}
