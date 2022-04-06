//
//  ViewController.swift
//  Text-Similarities
//
//  Created by Sophie Imhof on 4/6/22.
//

import UIKit
import NaturalLanguage

class ViewController: UIViewController {
    
    @IBOutlet weak var word1: UITextField!
    @IBOutlet weak var similarWordsButton: UIButton!
    @IBOutlet weak var similarWordsText: UILabel!
    
    
    @IBOutlet weak var sentence1: UITextField!
    @IBOutlet weak var sentence2: UITextField!
    @IBOutlet weak var similarSentButton: UIButton!
    @IBOutlet weak var similarSentText: UILabel!
    
    var simiarityRecognizer: SimilarityRecognizer = SimilarityRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func wordButtonTouch(_ sender: Any) {
        var similarWords: [(String, NLDistance)]
        var returnText: String = ""
        similarWords = simiarityRecognizer.findSimilarWords(word: word1.text ?? "word", numWords: 5)
        if (similarWords.isEmpty) {
            returnText = "Not a valid word."
        } else {
            for words in similarWords {
                returnText = returnText + String(format: words.0 + ", %.4f\n", words.1)
            }
        }
        similarWordsText.text = returnText
    }
    
    @IBAction func sentButtonClick(_ sender: Any) {
        if (sentence1.text == nil || sentence2.text == nil) {
            similarSentText.text = "Not a valid input."
        } else {
            var distance: NLDistance
            distance = simiarityRecognizer.compareSentenceSimilarity(sentence1: sentence1.text ?? "This is not a valid input." , sentence2: sentence2.text ?? "This is not a valid input")
        similarSentText.text = String(format: "Distance: %.4f", distance)
        }
    }


}

