//
//  AlertUnavailable.swift
//  MyCalendar
//
//  Created by Максим Боталов on 08.04.2022.
//

import UIKit

extension UIViewController {
    func alertUnavailable() {
        let alert = UIAlertController(title: "Функционал на доработке", message: nil, preferredStyle: .alert)
        let okeyAction = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
        alert.addAction(okeyAction)
        present(alert, animated: true, completion: nil)
    }
}
