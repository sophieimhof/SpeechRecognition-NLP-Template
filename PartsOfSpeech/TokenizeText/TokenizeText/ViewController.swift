//
//  ViewController.swift
//  TokenizeText
//
//  Created by Sophie Imhof on 3/28/22.
//

import UIKit
import NaturalLanguage

class ViewController: UIViewController {
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var tokens: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputText.becomeFirstResponder()
    }
   
    @IBAction func enterText(_ sender: Any) {
        tokens.text = retrieveTokens(from: inputText.text ?? "input text")
    }
    
    //Tokenization
    //Split text into individual words
    func retrieveTokens(from text: String, unit: NLTokenUnit = .word) -> String {
        let tokenizer = NLTokenizer(unit: unit)
        tokenizer.string = text
        
        var tokens = [String]()
        tokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { (tokenRange, _) -> Bool in
            tokens.append(String(text[tokenRange].lowercased()))
            return true
        }
        var tokenString = ""
        for word in tokens {
            tokenString = tokenString + "\n" + word
        }
        return tokenString
        
    }


}

