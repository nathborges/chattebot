//
//  ActionsViewController.swift
//  Chattebot
//
//  Created by Nathália Ferreira Borges on 19/02/22.
//

import UIKit
import SwiftyGif

class ActionsViewController: UIViewController {
    
    let gifManager = SwiftyGifManager(memoryLimit:100)
    var lastFeedAction = "alimentado pela última vez há muito tempo"

    
    //MARK: Outlets
    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var alimentarButton: UIButton!
    @IBOutlet weak var tocarMusicaButton: UIButton!
    @IBOutlet weak var lastTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roundedView.layer.cornerRadius = 39
        
        loadAndSetGifToImageView(gifName: "judging.gif")
        lastTime.text = lastFeedAction
    }
    
    // MARK: Set a gif on main image view
    func loadAndSetGifToImageView(gifName: String) {
        let gif = (try? UIImage(imageName: gifName))!
        self.statusImageView.setGifImage(gif, manager: gifManager, loopCount: -1)
    }
    
    // MARK: ESP request
    func httpRequest(requestUrl: String) {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 100.0
        let url = URL(string: requestUrl)!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {return}
        }
        task.resume()
    }
    
    // MARK: Button Feed Action method
    @IBAction func alimentarButtonAction(_ sender: UIButton) {
        loadAndSetGifToImageView(gifName: "eating.gif")
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { timer in
            self.loadAndSetGifToImageView(gifName: "judging.gif")
        }
        
        var urlFormatted = "http://192.168.15.79/?value=1&"
        httpRequest(requestUrl: urlFormatted)
        refreshTime()
    }
    
    // MARK: Button Buzzer Action method
    @IBAction func tocarMusicaButtonAction(_ sender: UIButton) {
        loadAndSetGifToImageView(gifName: "happy.gif")
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
            self.loadAndSetGifToImageView(gifName: "judging.gif")
        }
        
        var urlFormatted = "http://192.168.15.79/?value=2&"
        httpRequest(requestUrl: urlFormatted)
    }
    
    func refreshTime(){
        var date = Date()
        var calendar = Calendar.current

        var hour = calendar.component(.hour, from: date)
        var minute = calendar.component(.minute, from: date)
        var day = calendar.component(.day, from: date)
        var month = calendar.component(.month, from: date)
        
        lastFeedAction = "alimentado pela última vez no dia \(day)/\(month) às \(hour):\(minute)"
        lastTime.text = lastFeedAction
        
        
        
        
    }
    
    
    
}


