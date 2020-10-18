//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var ProgressLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    
    let eggTimes: [String:Int] = ["Soft": 1, "Medium": 8, "Hard": 12]
    
    var secondsRemaining: Int = 0
    var secondsRemainingOrigin: Float = 0.0
    
    var timer: Timer = Timer()

    @IBAction func EggPressed(_ sender: UIButton) {
        timer.invalidate()
        ProgressBar.progress = 0.0
        let hardnessType: String = sender.currentTitle!
        let cookTime: Int = eggTimes[hardnessType]!
        
        secondsRemainingOrigin = Float(cookTime) * 60.0
        secondsRemaining = Int(secondsRemainingOrigin)

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

        print(cookTime)

    }
    
    
    @objc func updateCounter() {
        if secondsRemaining > 0 {
            ProgressLabel.text = "\(secondsRemaining) seconds remaining"
            secondsRemaining -= 1
            var pR: Float = secondsRemainingOrigin - Float(secondsRemaining)
            pR = pR / (secondsRemainingOrigin)
            ProgressBar.progress = pR
        } else {
            timer.invalidate()
            ProgressBar.progress = 1.0
            ProgressLabel.text = "Done"
        }
    }
    
}
