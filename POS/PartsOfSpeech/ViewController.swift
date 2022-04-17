//
//  ViewController.swift
//  SpeechToText
//
//  Created by Sophie Imhof on 3/28/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton! //record button
    @IBOutlet weak var outputText: UILabel!
    
    var posDict: Dictionary<String, Array<String>> = [:] //
    var speechRec = SpeechRecognizer() //create speech recognizer object
    var posProc = POSProcessing()
    var recordOn = false //initialize record button to be set as off
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//action response to when record button is pressed
    @IBAction func buttonPressed(_ sender: UIButton) {
        if (!recordOn) { //if not currently recording audio
            speechRec.transcribe() //transcibe audio
            posDict = posProc.findPartsOfSpeech(text: speechRec.transcript)
            
            outputText.numberOfLines = 0
           
            outputText.text = getOutput()
            recordOn = true //change record button to be set as on
            sender.setTitle("Stop", for: .normal) //change button title to stop
        } else { //if currently recording
            speechRec.stopTranscribing() //stop transcription
            //posDict = posProc.findPartsOfSpeech(text: //speechRec.transcript)
            recordOn = false //change record button to be set as off
            sender.setTitle("Say something or ask a question", for: .normal) //change button title back to record
        }
    }
    
    func getOutput() -> String {
        
        var output: String = ""
        for (key, value) in posDict {
            output = key
            for (index, word) in value.enumerated() {
                if index > 0 {
                    output = output + ","
                }
                output = output + " "
                + word
            }
            output = output + "\n"
        }
        return output
    }
    
}

