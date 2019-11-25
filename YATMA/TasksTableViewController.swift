//
//  TasksTableViewController.swift
//  YATMA
//
//  Created by MAC on 25/11/2019.
//  Copyright © 2019 Gera Volobuev. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {

        var selectedCell: IndexPath?
        var defaults = UserDefaults.standard
        var tasks = [String]() {
            didSet {
                defaults.setValue(tasks, forKey: "saved")
                // update parent ViewController's tasks counter
                let p = (parent as? MainViewController)
                p?.numOfTasks.text = String(tasks.count)
                
            }
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Reload array with user defaults
            let previousTasks = defaults.value(forKey: "saved")
            if previousTasks != nil {
                tasks = previousTasks as! Array
            }
            
            // Table styling
            self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
            let backgroundView = UIView()
            let p = (parent as? MainViewController)
            backgroundView.backgroundColor = p?.view.backgroundColor
            tableView.backgroundColor = p?.view.backgroundColor
            
            // Animate table view
            tableView.alpha = 0
            UIView.animate(withDuration: 2, animations: { self.tableView.alpha = 1 })
        }
        
        
        // MARK: - Table view data source
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tasks.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Task", for: indexPath)
            cell.textLabel?.text = tasks[indexPath.row]
            
            // Cell styling
            let p = (parent as? MainViewController)
            let backgroundView = UIView()
            backgroundView.backgroundColor = p?.view.backgroundColor
            cell.selectedBackgroundView = backgroundView
            cell.backgroundColor = p?.view.backgroundColor
            cell.textLabel?.textColor = p?.numOfTasks.textColor
            
            return cell
        }
        
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
