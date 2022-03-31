//
//  CalendarNewEventProtocol.swift
//  MyCalendar
//
//  Created by Максим Боталов on 28.03.2022.
//

import Foundation

protocol CalendarNewEventProtocol {
    func newEventUpdate(title: String, date: String, time: String)
}

protocol CalendarNewBirthdayProtocol {
    func newBirthday(image: String, name: String, date: String)
}
