//
//  ViewController.swift
//  Ex10
//
//  Created by Alice’z Poy on 2022-10-28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var livesLabel: UILabel!
    @IBOutlet weak var timingLabel: UILabel!
    
    let questionDict =
    ["Pumpkin" : "🎃",
     "Panda" : "🐼",
     "Fox" : "🦊",
     "Mice" : "🐭",
     "Dog" : "🐶",
     "Cat" : "🐱",
     "Ghost" : "👻",
     "Maple" : "🍁",
     "Robot" : "🤖",
     "Brain" : "🧠"]
    
    var arrayButton: Array<UIButton> = []
    var answer = "???"
    var points = 0
    var lives = 5
    var timer = Timer()
    var seconds = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayButton.append(firstButton)
        arrayButton.append(secondButton)
        arrayButton.append(thirdButton)
        arrayButton.append(fourthButton)
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if seconds > 0 {
            seconds -= 1
        } else {
            timeout()
        }
        
        timingLabel.text = "Timing : \(seconds)"
    }
    
    func resetTimer() {
        seconds = 10
    }
    
    func timeout() {
        resetTimer()
        answerAction(UIButton())
    }
    
    //if timeout
    
    //if answer
    
    func updateQuestion() {
        let answerDict = questionDict.randomElement()
        
        answer = answerDict?.key ?? ""
        questionLabel.text = answerDict?.value
        
        let randomNumber = Int.random(in: 0...3)
        var tempArray = questionDict
        
        for index in 0...3 {
            if randomNumber == index {
                arrayButton[index].setTitle(answer, for: .normal)
                tempArray.removeValue(forKey: answer)
            } else { //ถ้าไม่ตรง
                var randomQuestionKey = tempArray.randomElement()?.key
                arrayButton[index].setTitle(randomQuestionKey, for: .normal)
                tempArray.removeValue(forKey: randomQuestionKey ?? "")
            }
        }
        resetTimer()
    }
    
    func restart() {
        lives = 5
        points = 0
        pointsLabel.text = "Points: \(points)"
        livesLabel.text = "Lives: \(lives)"
        updateQuestion()
        runTimer()
    }
    
    @IBAction func startAction(_ sender: Any) {
        restart()
    }
    
    @IBAction func answerAction(_ sender: UIButton) {
        if sender.currentTitle == answer {
            points += 1
            pointsLabel.text = "Points: \(points)"
        } else {
            lives -= 1
            livesLabel.text = "Lives: \(lives)"
        }
        
        if lives <= 0 {
            timer.invalidate()
            let alert = UIAlertController(title: "Game Over", message: "Do you wanna play again?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "no", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "yes", style: .default, handler: { [weak self] _ in
                guard let strongSelf = self else { return }
                strongSelf.restart()
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            updateQuestion()
        }
    }
}

