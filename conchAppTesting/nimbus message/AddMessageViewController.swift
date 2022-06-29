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
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newMessage = Message(entity: Message.entity(), insertInto: context)
            if let message = messageTextField.text
            {
                newMessage.name = message
//                vc?.messageArr.append(message) // legacy from non-core data version
                try? context.save()
                navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
}
