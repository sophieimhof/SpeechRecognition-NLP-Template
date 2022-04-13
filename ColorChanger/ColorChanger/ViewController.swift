//
//  ViewController.swift
//  SpeechToText
//
//  Created by Sophie Imhof on 3/28/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton! //record button
    @IBOutlet weak var buttonColor: UIColor! //transcription text box
    var speechRec = SpeechRecognizer() //create speech recognizer object
    var textProc = TextProcessing()
    var recordOn = false //initialize record button to be set as off
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//action response to when record button is pressed
    @IBAction func buttonPressed(_ sender: UIButton) {
        if (!recordOn) { //if not currently recording audio
            speechRec.transcribe() //transcibe audio
            buttonColor = textProc.findClosestColor(word: speechRec.transcript)
            
            recordOn = true //change record button to be set as on
            sender.setTitle("stop", for: .normal) //change button title to stop
        } else { //if currently recording
            speechRec.stopTranscribing() //stop transcription
            buttonColor = textProc.findClosestColor(word: speechRec.transcript)
            recordOn = false //change record button to be set as off
            sender.setTitle("say 1 word", for: .normal) //change button title back to record
        }
    }
    
}

