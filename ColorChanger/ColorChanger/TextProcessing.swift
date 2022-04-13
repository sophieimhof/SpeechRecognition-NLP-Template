//
//  TextProcessing.swift
//  SpeechToText
//
//  Created by Sharay Gao on 4/11/22.
//

import NaturalLanguage
import Foundation
import SwiftUI


class TextProcessing {
    
    func findClosestColor(word: String) -> Color{
        let colors = [Color.blue: "Blue",
                      Color.brown: "Brown",
                      Color.black: "Black",
                      Color.cyan: "Cyan",
                      Color.gray: "Gray",
                      Color.green: "Green",
                      Color.indigo: "Indigo",
                      Color.mint: "Mint",
                      Color.orange: "Orange",
                      Color.pink: "Pink",
                      Color.purple: "Purple",
                      Color.red: "Red",
                      Color.teal: "Teal",
                      Color.white: "White",
                      Color.yellow: "Yellow"]
            
        if let embedding = NLEmbedding.sentenceEmbedding(for: .english) {
            var closestColor = Color.clear
            var minDistance = embedding.distance(between: word, and: "clear")
            for (color, name) in colors {
                let distance = embedding.distance(between: word, and: name)
                if distance < minDistance {
                    closestColor = color
                    minDistance = distance
                }
            }
            return closestColor
        }
    }
    
}
