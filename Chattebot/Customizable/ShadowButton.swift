//
//  ShadowButton.swift
//  Chattebot
//
//  Created by Nathália Ferreira Borges on 19/02/22.
//

import UIKit

@IBDesignable
class ShadowButton: UIButton {

    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            self.updateButton()
        }
    }
    @IBInspectable var shadowOpacity: Float = 0.1 {
        didSet {
            self.updateButton()
        }
    }
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 3, height: 3) {
        didSet {
            self.updateButton()
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 15.0 {
        didSet {
            self.updateButton()
        }
    }

    func updateButton() {
        self.layer.shadowColor = self.shadowColor.cgColor
        self.layer.shadowOpacity = self.shadowOpacity
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowRadius = self.shadowRadius
    }
}
