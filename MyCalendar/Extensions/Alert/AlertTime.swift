//
//  AlertTime.swift
//  MyCalendar
//
//  Created by Максим Боталов on 06.04.2022.
//

import UIKit

extension UIViewController {
    func alertTime(complitionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .actionSheet)
        
        let datePiker = UIDatePicker()
        datePiker.datePickerMode = .time
        datePiker.preferredDatePickerStyle = .wheels
        datePiker.locale = NSLocale.system
        
        alert.view.addSubview(datePiker)
        
        let okay = UIAlertAction(title: "Установить", style: .default) { action in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let timeString = dateFormatter.string(from: datePiker.date)
            complitionHandler(timeString)
            

        }
        
        let cancel = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        
        alert.addAction(okay)
        alert.addAction(cancel)
        
        alert.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        datePiker.widthAnchor.constraint(equalTo: alert.view.widthAnchor).isActive = true
        datePiker.heightAnchor.constraint(equalToConstant: 160).isActive = true
        datePiker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 20).isActive = true
        datePiker.translatesAutoresizingMaskIntoConstraints = false
        
        present(alert, animated: true, completion: nil)
    }
}
