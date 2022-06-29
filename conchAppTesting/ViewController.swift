//
//  ViewController.swift
//  conchAppTesting
//
//  Created by Isah Vesel on 6/28/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        messageLabel.text = ""
    }

    var messageArr = ["hello :)", "you are doing great!", "have a beautiful day :)", "hello friend!"]
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func genNewButton(_ sender: Any) {
        messageLabel.text = messageArr[Int.random(in : 0..<messageArr.count)]
    }
    
}
