//
//  AlertDate.swift
//  MyCalendar
//
//  Created by Максим Боталов on 05.04.2022.
//

import UIKit

extension UIViewController {
    func alertDate(complitionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let datePiker = UIDatePicker()
        datePiker.datePickerMode = .date
        datePiker.preferredDatePickerStyle = .wheels
        
        alert.view.addSubview(datePiker)
        
        let okay = UIAlertAction(title: "Установить", style: .default) { action in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyy"
            let dateString = dateFormatter.string(from: datePiker.date)
            complitionHandler(dateString)
            

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

