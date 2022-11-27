//
//  ViewController.swift
//  Ex1
//
//  Created by Alice’z Poy on 2022-10-26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var whiteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: UIButton) {
        switch sender {
        case redButton:
            view.backgroundColor = .red
        case whiteButton:
            view.backgroundColor = .white
        default:
            break
        }
    }
    
}

