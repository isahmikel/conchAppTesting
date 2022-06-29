//
//  AddMessageViewController.swift
//  conchAppTesting
//
//  Created by Isah Vesel on 6/28/22.
//

import UIKit

class AddMessageViewController: UIViewController {

    let vc = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var messageTextField: UITextField!
    
    
    @IBAction func addMessageButton(_ sender: Any) {
        if let message = messageTextField.text
        {
            //message isn't being added to messageArr
            vc.messageArr.append(message)
        }
    }
    
}
