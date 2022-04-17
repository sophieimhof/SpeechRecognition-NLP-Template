//
//  TextProcessing.swift
//  SpeechToText
//
//  Created by Sharay Gao on 4/11/22.
//

import NaturalLanguage
import Foundation
import SwiftUI
import Speech


class POSProcessing {
    
    func findPartsOfSpeech(text: String) -> Dictionary<String, Array<String>>{
        var returnValue = Dictionary<String, Array<String>>()
        
        //let text = "What day is today"
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        tagger.string = text
        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace]
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange in
            if let tag = tag {
                //print("\(text[tokenRange]): \(tag.rawValue)")
                let word: String = String(text[tokenRange])
                let wordType = tag.rawValue
                
                if returnValue[wordType] == nil {
                    var words: [String] = []
                    words.append(word)
                    returnValue[wordType] = words
                } else {
                    var words: [String] = returnValue[wordType] ?? <#default value#>!
                    words.append(word)
                    returnValue[wordType] = words
                }
            
            }
            
            return true
        }
            
        
    }
    
}
