//
//  UpNextViewController.swift
//  conchAppTesting
//
//  Created by Isah Vesel on 6/29/22.
//

import UIKit

class UpNextViewController: UIViewController {
    
    var allTasks : [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

//        let taskArr = [taskOne, taskTwo, taskThree, taskFour]
//
//        testLabel.text = "\(String(describing : taskOne.date))"
//        let timetime = taskOne.date?.timeIntervalSinceNow
//        let yasslay = Int(timetime!)
//
//        var soonestTask = taskArr[0]
//        for task in taskArr
//        {
//            let soonestTaskTime = soonestTask.date?.timeIntervalSinceNow
//            let currentTaskTime = task.date?.timeIntervalSinceNow
//
//            if (Double(soonestTaskTime!) > Double(currentTaskTime!))
//            {
//                soonestTask = task
//            }
//        }

        
        
    }
    
    let calendar = Calendar.current
    let tz = TimeZone(secondsFromGMT : 0)
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
 
    @IBAction func addButton(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            
            let task = Task(entity : Task.entity(), insertInto : context)
            
            if let nameText = nameField.text
            {
                task.name = nameText
                task.date = datePicker.date
                
                allTasks.append(task)
            }
            
            var time = Double((task.date?.timeIntervalSinceNow)!) / 60
            var units = "minutes"
            
            if (time >= 60)
            {
                time /= 60
                units = "hours"
            }
            if (time >= 24)
            {
                time /= 24
                units = "days"
            }
            
            let timeInt = Int(time)
            daysLabel.text = ("\(task.name ?? "there is no name oops") in \(timeInt) \(units)")
        }
        
        getNextThree()
        
    }
    
    func getTasks()
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            if let coreDataTasks = try? context.fetch(Task.fetchRequest()) as? [Task]
            {
                allTasks = coreDataTasks
            }
        }
    }
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    
    func getNextThree()
    {
        getTasks()
         
        if (allTasks.count == 0)
        {
            labelOne.text = "no upcoming tasks"
            labelTwo.text = "no upcoming tasks"
            labelThree.text = "no upcoming tasks"
            
            return
        }
        
        labelTwo.text = "no upcoming tasks"
        labelThree.text = "no upcoming tasks"
        
        var firstTask = allTasks[0]
        for task in allTasks
        {
            let firstTaskTime = Double((firstTask.date?.timeIntervalSinceNow)!)
            let currentTaskTime = Double((task.date?.timeIntervalSinceNow)!)
            
            if (currentTaskTime > 0 && currentTaskTime < firstTaskTime)
            {
                firstTask = task
            }
        }
        let firstTaskTime = Double((firstTask.date?.timeIntervalSinceNow)!)
        
        
        var secondTask = allTasks[0]
        for task in allTasks
        {
            let secondTaskTime = Double((secondTask.date?.timeIntervalSinceNow)!)
            let currentTaskTime = Double((task.date?.timeIntervalSinceNow)!)
            
            if (currentTaskTime > 0 && currentTaskTime < secondTaskTime && currentTaskTime > firstTaskTime)
            {
                secondTask = task
            }
        }
        let secondTaskTime = Double((firstTask.date?.timeIntervalSinceNow)!)
        
        
        var thirdTask = allTasks[0]
        for task in allTasks
        {
            let thirdTaskTime = Double((thirdTask.date?.timeIntervalSinceNow)!)
            let currentTaskTime = Double((task.date?.timeIntervalSinceNow)!)
            
            if (currentTaskTime > 0 && currentTaskTime < thirdTaskTime && currentTaskTime > firstTaskTime && currentTaskTime > secondTaskTime)
            {
                thirdTask = task
            }
        }
        
        labelOne.text = getTaskString(task : firstTask)
        if (allTasks.count > 1)
        {
            labelTwo.text = getTaskString(task : secondTask)
        }
        if (allTasks.count > 2)
        {
            labelThree.text = getTaskString(task : thirdTask)
        }
        
    }
    
    func getTaskString(task : Task) -> String
    {
        var time = Double((task.date?.timeIntervalSinceNow)!) / 60
        var units = "minutes"
        
        if (time >= 60)
        {
            time /= 60
            units = "hours"
        }
        if (time >= 24)
        {
            time /= 24
            units = "days"
        }
        
        let timeInt = Int(time)
        return ("\(task.name ?? "there is no name oops") in \(timeInt) \(units)")
    }
    
}
