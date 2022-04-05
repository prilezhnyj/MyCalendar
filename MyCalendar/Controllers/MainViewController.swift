//
//  ViewController.swift
//  MyCalendar
//
//  Created by Максим Боталов on 25.03.2022.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        settingsTabBarControllers()
    }
    
    private func settingsTabBarControllers() {
        let calendarController = creationNavigationController(viewController: CalendarController(), nameItem: "Календарь", nameImageItem: "calendar.day.timeline.left")
//        let tasksViewController = creationNavigationController(viewController: TasksViewController(), nameItem: "Задачи", nameImageItem: "list.dash")
        let settingsController = creationNavigationController(viewController: SettingsController(), nameItem: "Настройки", nameImageItem: "gear")
        
        viewControllers = [calendarController, settingsController]
    }

    
    private func creationNavigationController(viewController: UIViewController, nameItem: String, nameImageItem: String) -> UINavigationController {
        let item = UITabBarItem(title: nameItem, image: UIImage(systemName: nameImageItem), tag: 0)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }


}

