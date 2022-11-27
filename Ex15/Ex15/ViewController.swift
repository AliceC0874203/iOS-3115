//
//  ViewController.swift
//  Ex15
//
//  Created by MacStudent on 2022-11-01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timingLabel: UILabel!
    
    var timer = Timer()
    var seconds = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        timer.invalidate()
        resetTimer()
    }
    
    func resetTimer() {
        seconds = 0.0
        timingLabel.text = timeToString(time: TimeInterval(seconds))
    }
    
    @objc func updateTimer() {
        seconds += 1.0
        timingLabel.text = timeToString(time: TimeInterval(seconds))
    }
    
    func timeToString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i.%02i", hours, minutes, seconds)
    }

    @IBAction func controlTimeAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            runTimer()
        case 1:
            stopTimer()
        default:
            break
        }
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        stopTimer()
        resetTimer()
    }
    
}

