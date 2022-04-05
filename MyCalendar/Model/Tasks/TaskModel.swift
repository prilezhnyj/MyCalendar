//
//  TaskModel.swift
//  MyCalendar
//
//  Created by Максим Боталов on 31.03.2022.
//

import Foundation
import RealmSwift

class TaskModel: Object {
    @Persisted var title: String = ""
    @Persisted var status: TaskStatus = .planned
    @Persisted var type: TaskType = .important
    
    enum TaskStatus: String, PersistableEnum {
        case planned
        case performed
    }
    
    enum TaskType: String, PersistableEnum {
        case important
        case current
    }
    
    convenience init(title: String, status: TaskStatus, type: TaskType) {
        self.init()
        self.title = title
        self.status = status
        self.type = type
    }
}
