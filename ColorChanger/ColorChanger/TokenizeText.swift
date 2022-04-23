//
//  TokenizeText.swift
//  TokenizeText
//
//  Created by Sophie Imhof on 3/28/22.
//

import Foundation
import NaturalLanguage

//Tokenization

let text = "Hi, Mr. Hegarty! My name is Emannuel. I'm an iOS developer and I live in New York. Nice to meet you here at Apple Inc."

func retrieveTokens(from text: String, unit: NLTokenUnit = .word) -> [String] {
    let tokenizer = NLTokenizer(unit: unit)
    tokenizer.string = text
    
    var tokens = [String]()
    tokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { (tokenRange, _) -> Bool in
        tokens.append(String(text[tokenRange].lowercased()))
        return true
    }
    return tokens
}
