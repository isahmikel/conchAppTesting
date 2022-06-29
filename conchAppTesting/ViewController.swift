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
        messageArr = createMsgs()
    }
    
    func createMsgs() -> [String] {
        ["hello :)", "you are doing great!", "have a beautiful day :)", "hello friend!"]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear \(messageArr)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear \(messageArr)")
    }

    var messageArr: [String] = []
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func genNewButton(_ sender: Any) {
        messageLabel.text = messageArr[Int.random(in : 0..<messageArr.count)]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? AddMessageViewController
        {
            nextVC.vc = self
        }
    }
    
}
