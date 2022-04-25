//
//  TextProcessing.swift
//  SpeechToText
//
//  Created by Sanjana Srinivasan on 4/11/22.
//

import NaturalLanguage
import Foundation
import SwiftUI
import Speech


class POSProcessing {
    
    func findPartsOfSpeech(text: String) -> Dictionary<String, Array<String>>{
        var returnValue = Dictionary<String, Array<String>>() //dictionary of parts of speech from the inputted text
        
        //let text = "What day is today"
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        tagger.string = text
        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace] //leave out punctuation and white spaces
        //enumerate through range of text using tags
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange in
            if let tag = tag {
                //print("\(text[tokenRange]): \(tag.rawValue)") to print each word with part of speech on new line
                let word: String = String(text[tokenRange])
                let wordType = tag.rawValue
                
                //add each word to the dictionary with its associated part of speech
                if returnValue[wordType] == nil {
                    var words: [String] = []
                    words.append(word)
                    returnValue[wordType] = words
                } else {
                    var words: [String] = returnValue[wordType] ?? []
                    words.append(word)
                    returnValue[wordType] = words
                }
            
            }
            
            return true
        }
            
        return returnValue //parts of speech dictionary
    }
    
}
