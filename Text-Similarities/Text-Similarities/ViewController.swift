//
//  ViewController.swift
//  Text-Similarities
//
//  Created by Sophie Imhof on 4/6/22.
//

import UIKit
import NaturalLanguage

class ViewController: UIViewController {
    
    @IBOutlet weak var word1: UITextField! //text field for user input of a word
    @IBOutlet weak var similarWordsButton: UIButton! //button that finds similar words to user input word
    @IBOutlet weak var similarWordsText: UILabel! //text for similar words output
    
    
    @IBOutlet weak var sentence1: UITextField! //text field for user input sentence 1
    @IBOutlet weak var sentence2: UITextField! //text field for user input sentence 2
    @IBOutlet weak var similarSentButton: UIButton! //button that finds distance between two sentences
    @IBOutlet weak var similarSentText: UILabel! //text to display distance
    
    var simiarityRecognizer: SimilarityRecognizer = SimilarityRecognizer() //create a similarity recognizer object
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //finds similar words when button is pressed
    @IBAction func wordButtonTouch(_ sender: Any) {
        var similarWords: [(String, NLDistance)]
        var returnText: String = ""
        similarWords = simiarityRecognizer.findSimilarWords(word: word1.text ?? "word", numWords: 5) //default text is word
        if (similarWords.isEmpty) {
            returnText = "Not a valid word." //returns this response if findSimilarWords fails
        } else {
            for words in similarWords {
                returnText = returnText + String(format: words.0 + ", %.4f\n", words.1)
            } //formats similar words with distances
        }
        similarWordsText.text = returnText //sets UI text to return text
    }
    
    //finds similarity between sentences when button is pressed
    @IBAction func sentButtonClick(_ sender: Any) {
        if (sentence1.text == nil || sentence2.text == nil) {
            similarSentText.text = "Not a valid input." //checks for valid input
        } else {
            var distance: NLDistance
            distance = simiarityRecognizer.compareSentenceSimilarity(sentence1: sentence1.text ?? "This is not a valid input." , sentence2: sentence2.text ?? "This is not a valid input")
        similarSentText.text = String(format: "Distance: %.4f", distance) //formats response distance from compareSentenceSimilarity function
        }
    }


}

