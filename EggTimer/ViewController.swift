//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textTitle: UILabel!
    let eggTimer = ["Soft": 5,"Medium": 7,"Hard": 12]
    var remainingSeconds = 60
    var timer = Timer() // Create a Timer Object
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate() // Stop the previous timer and start with the new timer
        let hardness = sender.currentTitle!
         remainingSeconds = eggTimer[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        
        
    }
    @objc func UpdateTimer(){
        if remainingSeconds > 0 {
            remainingSeconds -= 1
        }else {
            timer.invalidate()
            textTitle.text = "Done" // Setting Text of a label
        }
    }
    
}
