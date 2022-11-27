//
//  ViewController.swift
//  Ex2
//
//  Created by Alice’z Poy on 2022-10-26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userDice: UIImageView!
    @IBOutlet weak var computerDice: UIImageView!
    @IBOutlet weak var computerScoreLabel: UILabel!
    @IBOutlet weak var userScoreLabel: UILabel!
    
    var computerScore = 0
    var userScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func thorwDicesButtonAction(_ sender: Any) {
        let random1 = Int.random(in: 1...6)
        let random2 = Int.random(in: 1...6)
        
        computerDice.image = UIImage(named: "dice\(random1)")
        userDice.image = UIImage(named: "dice\(random2)")
        
        let score = abs(random1 - random2)
        
        if random1 > random2 {
            computerScore += score
            computerScoreLabel.text = "Score : \(computerScore)"
        } else {
            userScore += score
            userScoreLabel.text = "Score : \(userScore)"
        }
    }
}

