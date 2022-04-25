//
//  ViewController.swift
//  SpeechToText
//
//  Created by Sophie Imhof on 3/28/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton! //record button
    @IBOutlet weak var transText: UILabel! //transcription text box
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
            
            recordOn = true //change record button to be set as on
            sender.setTitle("stop", for: .normal) //change button title to stop
        } else { //if currently recording
            speechRec.stopTranscribing() //stop transcription
            //transText.text = speechRec.transcript //set transciption text
            posDict = posProc.findPartsOfSpeech(text: speechRec.transcript) //get parts of speec for each word
            print(posDict)
            transText.numberOfLines = 0
           
            transText.text = speechRec.transcript + "\n\n" + getOutput()
            recordOn = false //change record button to be set as off
            sender.setTitle("record", for: .normal) //change button title back to record
        }
    }
    
    func getOutput() -> String {
        
        var output: String = ""
        for (key, value) in posDict {
            output = output + key
            for (index, word) in value.enumerated() {
                if index > 0 {
                    output = output + ","
                }
                output = output + " "
                + word
            }
            output = output + "\n"
        }
        return output //get words and parts of speech values in format to be displayed
    }
    
}

