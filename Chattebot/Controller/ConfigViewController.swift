//
//  ConfigViewController.swift
//  Chattebot
//
//  Created by Nathália Ferreira Borges on 19/02/22.
//

import Foundation
import UIKit

class ConfigViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var textName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    //MARK: Show the alert
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "Ok", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: Checks if the name is longer than 10 letters or is empty
    func verifyName(name: String) {
        if (name == "" || name.count > 10) {
            showAlert(title: "", message: "O nome não deve estar vazio ou ser maior que 10 caracteres")
            return
        }
    }
    
    @IBAction func clickOnButton(_ sender: UIButton) {
        if self.textField.text == "nil" {
            return
        }
        
        textName = self.textField.text ?? "humano"
        verifyName(name: textName)
        let defaults = UserDefaults.standard
        
        defaults.set(textName, forKey: "name")
        
        let mainViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainView")
        self.navigationController?.pushViewController(mainViewController!, animated: true)
    }
}

