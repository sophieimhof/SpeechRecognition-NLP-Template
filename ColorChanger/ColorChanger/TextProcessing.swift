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
        //Preset list of colors
        let colors = [Color.blue: "Blue",
                      //Color.black: "Black",
                      Color.green: "Green",
                      Color.purple: "Purple",
                      Color.red: "Red",
                      Color.white: "White",
                      Color.yellow: "Yellow",
                      /*Color.teal: "Teal",
                      Color.mint: "Mint",
                      Color.cyan: "Cyan",
                      Color.gray: "Gray",
                      Color.brown: "Brown",
                      Color.indigo: "Indigo",
                      Color.orange: "Orange",
                      Color.pink: "Pink"*/
                      ]
            
        if let embedding = NLEmbedding.sentenceEmbedding(for: .english) {
            var closestColor = Color.white //default color
            var minDistance = embedding.distance(between: word, and: "White")
            for (color, name) in colors {
                let distance = embedding.distance(between: word, and: name) //finds distance
                if distance < minDistance { //updates min distance
                    closestColor = color
                    minDistance = distance
                }
            }
            return closestColor //returns closest color to given word
        }
        return Color.white
    }
    
}
