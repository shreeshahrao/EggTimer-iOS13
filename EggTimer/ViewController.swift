//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import  AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var textTitle: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimer = ["Soft": 5,"Medium": 7,"Hard": 12]
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    var timer = Timer() // Create a Timer Object
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 0.0
        secondsPassed = 0
        
        timer.invalidate() // Stop the previous timer and start with the new timer
        let hardness = sender.currentTitle!
        textTitle.text = hardness
            totalTime = eggTimer[hardness]!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        
        
    }
    @objc func UpdateTimer(){
        if secondsPassed <= totalTime {
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            secondsPassed += 1
        }else {
            timer.invalidate()
            textTitle.text = "Done" // Setting Text of a label
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try!AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
    
}
