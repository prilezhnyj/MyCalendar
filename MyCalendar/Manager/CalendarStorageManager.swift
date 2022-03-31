//
//  CalendarStorageManager.swift
//  MyCalendar
//
//  Created by Максим Боталов on 29.03.2022.
//

import RealmSwift

let realm = try! Realm()

class CalendarStorageManager {
    static func saveEvent(_ event: CalendarModel) {
        try! realm.write({
            realm.add(event)
        })
    }
    
    static func deleteEvent(_ event: CalendarModel) {
        try! realm.write({
            realm.delete(event)
        })
    }
}

class CalendarBirthdayStorageManager {
    static func saveEvent(_ birthday: BirthdayModel) {
        try! realm.write({
            realm.add(birthday)
        })
    }
    
    static func deleteBirthday(_ birthday: BirthdayModel) {
        try! realm.write({
            realm.delete(birthday)
        })
    }
}
