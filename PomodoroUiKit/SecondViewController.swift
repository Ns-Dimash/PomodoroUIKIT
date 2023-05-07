//
//  SecondViewController.swift
//  PomodoroUiKit
//
//  Created by Dimash Nsanbaev on 5/4/23.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        view.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 30/255, alpha: 1)
        // Initialize a UITableView instance
        tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        // Register the UITableViewCell class
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // Add the UITableView to the view hierarchy
        view.addSubview(tableView)
    }
}

// Implement the UITableViewDataSource and UITableViewDelegate protocols
extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // We only need one section
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // We want two rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.row == 0 {
            // Configure the first row
            cell.textLabel?.text = "Focus time"
            let textField = UITextField(frame: CGRect(x: cell.contentView.bounds.width - 10, y: 10, width: 100, height: 30))
            textField.textColor = .gray
            textField.text = "25:00"

            cell.contentView.addSubview(textField)
        } else {
            // Configure the second row
            cell.textLabel?.text = "Break time"
            let textField = UITextField(frame: CGRect(x: cell.contentView.bounds.width - 10, y: 10, width: 100, height: 30))
            textField.text = "05:00"
            textField.textColor = .gray

            cell.contentView.addSubview(textField)
            
        }
        
        return cell
    }
}
