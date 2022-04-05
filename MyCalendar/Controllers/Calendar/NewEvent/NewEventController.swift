//
//  NewEventController.swift
//  MyCalendar
//
//  Created by Максим Боталов on 25.03.2022.
//

import UIKit

class NewEventController: UIViewController {
    
    var delelete: CalendarNewEventProtocol!
    
    let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Название мероприятия"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите название мероприятия"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let headerDateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата мероприятия"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите дату мероприятия"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let headerTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "Время мероприятия"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите время мероприятия"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Новое событие"
        
        settingConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveButton))
        
    }
}


// MARK: - Methods & @objc

extension NewEventController {
    
    private func checkValidTextField(_ sender: UIBarButtonItem) {
        if titleTextField.text?.isEmpty != nil && dateTextField.text?.isEmpty != nil && titleTextField.text?.isEmpty != nil {
            sender.style = .done
        } else {
            sender.style = .plain
        }
    }
        
    @objc private func saveButton(_ sender: UIBarButtonItem) {
        if titleTextField.text?.isEmpty == true || dateTextField.text?.isEmpty == true || timeTextField.text?.isEmpty == true {
            let alert = UIAlertController(title: "Ошибка заполнения", message: "Необходимо заполнить все поля", preferredStyle: .alert)
            let okeyAction = UIAlertAction(title: "Понятно", style: .cancel, handler: nil)
            alert.addAction(okeyAction)
            present(alert, animated: true, completion: nil)
        } else {
            delelete.newEventUpdate(title: titleTextField.text!, date: dateTextField.text!, time: timeTextField.text!)
            navigationController?.popViewController(animated: true)
            print("Сохраняю мероптиятие")
        }
    }
}


// MARK: - SettingConstraints

extension NewEventController {
    private func settingConstraints() {
        
        view.addSubview(headerTitleLabel)
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            headerTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            headerTitleLabel.heightAnchor.constraint(equalToConstant: 21)])
        
        view.addSubview(titleTextField)
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: 10),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            titleTextField.heightAnchor.constraint(equalToConstant: 34)])
        
        view.addSubview(headerDateLabel)
        NSLayoutConstraint.activate([
            headerDateLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 30),
            headerDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            headerDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            headerDateLabel.heightAnchor.constraint(equalToConstant: 21)])
        
        view.addSubview(dateTextField)
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: headerDateLabel.bottomAnchor, constant: 10),
            dateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dateTextField.heightAnchor.constraint(equalToConstant: 34)])
        
        view.addSubview(headerTimeLabel)
        NSLayoutConstraint.activate([
            headerTimeLabel.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 30),
            headerTimeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            headerTimeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            headerTimeLabel.heightAnchor.constraint(equalToConstant: 21)])
        
        view.addSubview(timeTextField)
        NSLayoutConstraint.activate([
            timeTextField.topAnchor.constraint(equalTo: headerTimeLabel.bottomAnchor, constant: 10),
            timeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timeTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            timeTextField.heightAnchor.constraint(equalToConstant: 34)])
    }
}
