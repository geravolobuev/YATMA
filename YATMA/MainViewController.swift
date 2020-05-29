//
//  MainViewController.swift
//  YATMA
//
//  Created by MAC on 25/11/2019.
//  Copyright © 2019 Gera Volobuev. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var defaults = UserDefaults.standard
    var data: String = ""
    
    let monday = #colorLiteral(red: 1, green: 0.4419622421, blue: 0.4850247502, alpha: 1)
    let tuesday = #colorLiteral(red: 0.8161647916, green: 0.7689071298, blue: 0.9427241683, alpha: 1)
    let wednesday = #colorLiteral(red: 0.1900797188, green: 0.6137430668, blue: 0.9128838181, alpha: 1)
    let thursday = #colorLiteral(red: 1, green: 0.9069669843, blue: 0.4727165103, alpha: 1)
    let friday = #colorLiteral(red: 0.6764479876, green: 0.8764690757, blue: 0.8029221892, alpha: 1)
    let saturday = #colorLiteral(red: 0.9972990155, green: 0.4417770505, blue: 0.662532568, alpha: 1)
    let sunday = #colorLiteral(red: 1, green: 0.5610082746, blue: 0.3345819712, alpha: 1)
    
    @IBOutlet weak var addTask: UIButton!
    @IBOutlet weak var numOfTasks: UILabel!
    
    @IBAction func addTaskTapped(_ sender: UIButton) {
        let customAlert = self.storyboard?.instantiateViewController(withIdentifier: "CustomAlert") as! CustomAlertView
        customAlert.providesPresentationContextTransitionStyle = true
        customAlert.definesPresentationContext = true
        customAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        customAlert.delegate = self
        self.present(customAlert, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Colors for background
        let colors = [monday, tuesday, wednesday, thursday, friday, saturday, sunday]
        self.view.backgroundColor = colors.randomElement()
        
        // Show number of tasks left in array
        if let tasksLeft = (children[0] as? TasksTableViewController)?.tasks.count {
            numOfTasks.text = String(tasksLeft)
            numOfTasks.textColor = .white
        }
        
        // Animation
        numOfTasks.alpha = 0
        addTask.alpha = 0
        UIView.animate(withDuration: 1, animations: { self.numOfTasks.alpha = 1 })
        UIView.animate(withDuration: 1, animations: { self.addTask.alpha = 1 })
    }
    
}

extension MainViewController: CustomAlertViewDelegate {
    
    // Update array with new entry if its not empty
    func okButtonTapped(textFieldValue: String) {
        if !textFieldValue.isEmpty {
            self.data = textFieldValue
            let child = (children[0] as? TasksTableViewController)
            child?.tasks.insert(data, at: 0)
            child?.tableView.beginUpdates()
            child?.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .top)
            child?.tableView.endUpdates()
        }
    }
    
    func cancelButtonTapped() {
    }
}
