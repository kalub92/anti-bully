//
//  ViewController.swift
//  AntiBully
//
//  Created by Caleb Stultz on 8/13/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit
import CoreML

class ViewController: UIViewController {

    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var sentenceTextField: UITextField!
    
    var viewModel: ViewModel!
    
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
        viewModel = ViewModel(textData: sentence)
        predictionLabel.text = viewModel.sentiment.text
        sentenceTextField.text = ""
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        analyzeBtnWasPressed(sentenceTextField)
        return true
    }
}
