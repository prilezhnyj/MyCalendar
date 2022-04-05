//
//  CalendarModel.swift
//  MyCalendar
//
//  Created by Максим Боталов on 28.03.2022.
//

import Foundation
import RealmSwift

class CalendarModel: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var time: String = ""
    
    convenience init(title: String, date: String, time: String) {
        self.init()
        self.title = title
        self.date = date
        self.time = time
    }
}
