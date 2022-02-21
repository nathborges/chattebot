//
//  SecondController.swift
//  Chattebot
//
//  Created by Nathália Ferreira Borges on 19/02/22.
//

import UIKit
import SwiftyGif

class ActionsViewController: UIViewController {
    
    let gifManager = SwiftyGifManager(memoryLimit:100)

    @IBOutlet weak var roundedView: UIView!

    @IBOutlet weak var statusImageView: UIImageView!
    
    @IBOutlet weak var alimentarButton: UIButton!
    
    @IBOutlet weak var tocarMusicaButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedView.layer.cornerRadius = 39
        // An animated UIImage
      
        loadAndSetGifToImageView(gifName: "judging.gif")
        
    }

    func loadAndSetGifToImageView(gifName: String) {
        let gif = (try? UIImage(imageName: gifName))!
        self.statusImageView.setGifImage(gif, manager: gifManager, loopCount: -1)
    }
    
    @IBAction func alimentarButtonAction(_ sender: UIButton) {
        loadAndSetGifToImageView(gifName: "eating.gif")
    }
    
    @IBAction func tocarMusicaButtonAction(_ sender: UIButton) {
        loadAndSetGifToImageView(gifName: "dontcare.gif")
    }
    
    
}


