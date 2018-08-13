//
//  ViewModel.swift
//  AntiBully
//
//  Created by Caleb Stultz on 8/13/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    
    public private (set) var textData: String
    
    init(textData: String) {
        self.textData = textData
        super.init()
    }
    
    func analyze(text: String) -> String {
        let prediction = try? BullyClassifier().prediction(text: text)
        guard let label = prediction?.label else { return "neutral" }
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
