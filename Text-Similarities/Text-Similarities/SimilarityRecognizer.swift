//
//  SimilarityRecognizer.swift
//  Text-Similarities
//
//  Created by Sophie Imhof on 4/6/22.
//
import NaturalLanguage
import Foundation


class SimilarityRecognizer {
    
    func findSimilarWords(word: String, numWords: Int) -> [(String, NLDistance)] {
        if let embedding = NLEmbedding.wordEmbedding(for: .english) {
            let similarWords = embedding.neighbors(for: word, maximumCount: numWords)
            return similarWords
        }
        return Array<(String, Double)>()
    }
    
    func compareSentenceSimilarity(sentence1: String, sentence2: String) -> NLDistance {
        if let embedding = NLEmbedding.sentenceEmbedding(for: .english) {
            let distance = embedding.distance(between: sentence1, and: sentence2)
            return distance
        }
        return 0
    }
    
}
