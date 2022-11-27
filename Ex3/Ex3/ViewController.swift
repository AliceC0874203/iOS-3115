//
//  ViewController.swift
//  Ex3
//
//  Created by Alice’z Poy on 2022-10-26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dollarUSTextField: UITextField!
    @IBOutlet weak var dollarCADTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convertAction(_ sender: Any) {
        let dollarUS = dollarUSTextField.text
        let dollarCAD = dollarCADTextField.text
        
        if dollarUS == "" && dollarCAD == "" {
    
            let alert = UIAlertController(title: "Please input a number to convert", message: nil, preferredStyle: .alert)
    
            let okButton = UIAlertAction(title: "OK", style: .default) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            
            alert.addAction(okButton)
            present(alert, animated: true)
        } else if let dollarUS = dollarUS, dollarUS != "" {
            dollarCADTextField.text = String(format: "%f", (Double(dollarUS) ?? 0) * 1.36)
        } else if let dollarCAD = dollarCAD, dollarCAD != "" {
            dollarUSTextField.text = String(format: "%f", (Double(dollarCAD) ?? 0) / 1.36)
        }
    }
    
}

