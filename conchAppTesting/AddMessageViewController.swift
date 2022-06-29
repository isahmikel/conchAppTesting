//
//  AddMessageViewController.swift
//  conchAppTesting
//
//  Created by Isah Vesel on 6/28/22.
//

import UIKit

class AddMessageViewController: UIViewController {

    var vc:ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var messageTextField: UITextField!
    
    
    @IBAction func addMessageButton(_ sender: Any) {
        if let message = messageTextField.text
        {
            vc?.messageArr.append(message)
            navigationController?.popViewController(animated: true)
        }
    }
    
}
