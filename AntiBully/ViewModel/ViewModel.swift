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
    
    lazy public private (set) var sentiment: Sentiment = {
        let prediction = try? BullyClassifier().prediction(text: textData)
        guard let label = prediction?.label else { fatalError() }
        let emojiResponse = emojify(label: label).rawValue
        return Sentiment(text: emojiResponse)
    }()
    
    init(textData: String) {
        self.textData = textData
        super.init()
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
