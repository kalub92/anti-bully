//
//  RoundedButton.swift
//  AntiBully
//
//  Created by Caleb Stultz on 8/13/18.
//  Copyright © 2018 Caleb Stultz. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 3
        clipsToBounds = true
        layer.cornerRadius = frame.height / 2
    }
    
}
