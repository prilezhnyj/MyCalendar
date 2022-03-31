//
//  BirthdayModel.swift
//  MyCalendar
//
//  Created by Максим Боталов on 28.03.2022.
//

import Foundation
import RealmSwift

class BirthdayModel: Object {
    @objc dynamic var image: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var date: String = ""
    
    convenience init(image: String, name: String, date: String) {
        self.init()
        self.image = image
        self.name = name
        self.date = date
    }
}
