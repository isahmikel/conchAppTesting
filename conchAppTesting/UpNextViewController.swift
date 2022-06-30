//
//  UpNextViewController.swift
//  conchAppTesting
//
//  Created by Isah Vesel on 6/29/22.
//

import UIKit

class UpNextViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let taskArr = [taskOne, taskTwo, taskThree, taskFour]
        
        for task in taskArr
        {
            randomizeDate(task : task)
        }
        
        
        
    }
    
    let calendar = Calendar.current
    let tz = TimeZone(secondsFromGMT : 0)
    
    var taskOne = Task()
    var taskTwo = Task()
    var taskThree = Task()
    var taskFour = Task()
   
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testLabel2: UILabel!
    @IBOutlet weak var testLabel3: UILabel!
    @IBOutlet weak var testLabel4: UILabel!
    
    func randomizeDate(task : Task)
    {
        var date = DateComponents()
        date.timeZone = tz
        date.year = 2022
        date.month = Int.random(in : 7..<13)
        date.day = Int.random(in : 1..<31)
        date.hour = Int.random(in : 1..<24)
        date.minute = Int.random(in : 1..<60)
        
        task.date = calendar.date(from : date)
    }
    
}
