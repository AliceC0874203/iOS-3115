//
//  ViewController.swift
//  Ex5
//
//  Created by Alice’z Poy on 2022-10-28.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var primeNumberLabel: UILabel!
    
    @IBOutlet weak var resultImageView: UIImageView!
    
    @IBOutlet weak var timingLabel: UILabel!
    
    var primeNumber: Int = Int.random(in: 1...99)
    var timer = Timer()
    var seconds = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        runTimer()
        resultImageView.isHidden = true
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds > 0 {
            seconds -= 1
        } else {
            resetTimer()
        }
        
        timingLabel.text = "\(seconds)"
    }
    
    func resetTimer() {
        seconds = 3
        primeNumber = Int.random(in: 1...99)
        primeNumberLabel.text = String(primeNumber)
    }

    @IBAction func answerAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            //Prime
            checkTheAnswer(isTrue: true)
        case 1:
            //Not Prime
            checkTheAnswer(isTrue: false)
        default:
            break
        }
    }
    
    func checkTheAnswer(isTrue: Bool) {
        resultImageView.isHidden = false
        if isPrime(primeNumber) == isTrue {
            resultImageView.image = UIImage(named: "correct")
        } else {
            resultImageView.image = UIImage(named: "wrong")
        }
        
        resetTimer()
    }
    
    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
    
}

