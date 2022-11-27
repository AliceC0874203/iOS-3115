//
//  ViewController.swift
//  Ex14
//
//  Created by Alice’z Poy on 2022-11-01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var numberTextField: UITextField!
    var dataSet: Array<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func insertAction(_ sender: Any) {
        dataSet = []
        let number = Int(numberTextField.text ?? "0")
        var prod = 0
        
        for num in 1...20 {
            prod = (number ?? 0) * num
            dataSet.append(prod)
        }
        
        tableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(dataSet[indexPath.row])"
        return cell
    }
}

