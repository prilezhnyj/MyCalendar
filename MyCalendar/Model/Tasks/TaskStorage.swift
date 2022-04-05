//
//  TaskStorage.swift
//  MyCalendar
//
//  Created by Максим Боталов on 02.04.2022.
//

import Foundation

class TasksStorage {
    func loadTask() -> [TaskModel] {
        var taskTest = [TaskModel]()
        
        taskTest.append(TaskModel(title: "Купить хлеб", status: .planned, type: .important))
        taskTest.append(TaskModel(title: "Поставить будильник", status: .planned, type: .important))
        taskTest.append(TaskModel(title: "Вымыть полы", status: .performed, type: .current))
        
        return taskTest
    }
    
    func saveTasks(_ tasks: [TaskModel]) {}
}
