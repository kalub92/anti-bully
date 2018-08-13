//
//  ViewController.swift
//  AntiBully
//
//  Created by Caleb Stultz on 8/13/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit
import CoreML

enum Emotion: String {
    case kindness = "Kind 🤗"
    case encouragment = "Encouraging 😃"
    case mean = "Mean 🤬"
    case neutral = "Neutral 😶"
}

class ViewController: UIViewController {

    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var sentenceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sentenceTextField.delegate = self
        sentenceTextField.becomeFirstResponder()
    }
    
    @IBAction func analyzeBtnWasPressed(_ sender: Any) {
        guard sentenceTextField.text != "" else {
            predictionLabel.text = "Please enter a sentence below."
            return
        }
        guard let sentence = sentenceTextField.text else { return }
        predictionLabel.text = analyze(text: sentence)
        sentenceTextField.text = ""
    }
    
    func analyze(text: String) -> String {
        let prediction = try? BullyClassifier().prediction(text: text)
        guard let label = prediction?.label else { fatalError() }
        return emojify(label: label).rawValue
    }
    
    func emojify(label: String) -> Emotion {
        switch label {
        case "kindness":
            return .kindness
        case "encouragement":
            return .encouragment
        case "mean":
            return .mean
        case "neutral":
            return .neutral
        default:
            return .neutral
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        analyzeBtnWasPressed(sentenceTextField)
        return true
    }
}
