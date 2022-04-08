//
//  AlertNoAccess.swift
//  MyCalendar
//
//  Created by Максим Боталов on 08.04.2022.
//

import UIKit

extension UIViewController {
    func alertNoAccess() {
        let alert = UIAlertController(title: "Ошибка", message: "На данный момент редактирование события невозможно. Пожалуйста, удалите и создайте событие заново.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:  "Закрыть", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}


