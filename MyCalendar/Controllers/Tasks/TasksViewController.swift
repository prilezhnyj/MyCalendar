//
//  TasksViewController.swift
//  MyCalendar
//
//  Created by Максим Боталов on 25.03.2022.
//

import UIKit

class TasksViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Задачи"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)

    }
}
