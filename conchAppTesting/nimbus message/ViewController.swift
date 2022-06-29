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
        getMessages()
    }
    
    let ogMessageArr = ["go at your own pace, we'll handle the rest :)", "hello friend :)", "have a beautiful day :)"]
    
    func getMessages() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataMessages = try? context.fetch(Message.fetchRequest()) as? [Message]
            {
                messageArr =  coreDataMessages
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear \(messageArr)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("view did appear \(messageArr)")
    }

    var messageArr: [Message] = []
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func genNewButton(_ sender: Any) {
        let randNum = Int.random(in : 0..<(messageArr.count + ogMessageArr.count))
        if (randNum < messageArr.count)
        {
            messageLabel.text = messageArr[randNum].name
        }
        else
        {
            messageLabel.text = ogMessageArr[randNum - messageArr.count]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? AddMessageViewController
        {
            nextVC.vc = self
        }
    }
    
}
