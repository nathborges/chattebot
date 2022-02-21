//
//  ViewController.swift
//  Chattebot
//
//  Created by Nathália Ferreira Borges on 17/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    var name = "oi, humano"
    
    @IBOutlet weak var firstLabel: UILabel!
    
    override func viewDidLoad() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        let newName = defaults.string(forKey: "name")
        
        if (newName == nil) {
            self.name = "oi, humano"
            return
        }
        
        firstLabel.text = "oi, \(newName!)"
    }
    
    
    
    @IBAction func configButton(_ sender: UIButton) {
        let configViewController = self.storyboard?.instantiateViewController(withIdentifier: "ConfigView")
        self.navigationController?.pushViewController(configViewController!, animated: true)
    }
    
    @IBAction func miauButton(_ sender: UIButton) {
        let actionsViewController = self.storyboard?.instantiateViewController(withIdentifier: "ActionsView")
        self.navigationController?.pushViewController(actionsViewController!, animated: true)
    }
    
}

