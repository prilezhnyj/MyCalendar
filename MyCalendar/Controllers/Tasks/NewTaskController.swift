//
//  NewTaskController.swift
//  MyCalendar
//
//  Created by Максим Боталов on 31.03.2022.
//

//import Foundation
//import UIKit
//
//class NewTaskController: UIViewController {
//    
//    let headerTitleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Название задачи"
//        label.textColor = .darkGray
//        label.font = UIFont.boldSystemFont(ofSize: 17)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    let titleTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Введите название назадчи"
//        textField.borderStyle = .roundedRect
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        return textField
//    }()
//    
//    let headerTypeSelection: UILabel = {
//        let label = UILabel()
//        label.text = "Выберите тип задачи"
//        label.textColor = .darkGray
//        label.font = UIFont.boldSystemFont(ofSize: 17)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    let typeSelection: UISegmentedControl = {
//        let segmentedControl = UISegmentedControl(items: ["Важная", "Текущая"])
//        segmentedControl.selectedSegmentIndex = 0
//        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
//        return segmentedControl
//    }()
//    
//    let discriptionLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .left
//        label.text = taskImportantTypeDescription
//        label.textColor = .systemGray
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Новая задача"
//        settingConstraints()
//        
//        typeSelection.addTarget(self, action: #selector(choiceSegmentedControlAction), for: .valueChanged)
//        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveNewTask))
//    }
//}
//
//extension NewTaskController {
//    @objc private func choiceSegmentedControlAction() {
//        if typeSelection.selectedSegmentIndex == 0 {
//            discriptionLabel.text = taskImportantTypeDescription
//        } else {
//            discriptionLabel.text = taskPlannedTypeDescription
//        }
//    }
//    
//    @objc private func saveNewTask() {
//        print("Save")
//        navigationController?.popViewController(animated: true)
//    }
//}
//
//extension NewTaskController {
//    private func settingConstraints() {
//        
//        view.addSubview(headerTitleLabel)
//        NSLayoutConstraint.activate([
//            headerTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
//            headerTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            headerTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            headerTitleLabel.heightAnchor.constraint(equalToConstant: 21)])
//        
//        view.addSubview(titleTextField)
//        NSLayoutConstraint.activate([
//            titleTextField.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: 10),
//            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            titleTextField.heightAnchor.constraint(equalToConstant: 34)])
//        
//        view.addSubview(headerTypeSelection)
//        NSLayoutConstraint.activate([
//            headerTypeSelection.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 30),
//            headerTypeSelection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            headerTypeSelection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            headerTypeSelection.heightAnchor.constraint(equalToConstant: 21)])
//        
//        view.addSubview(typeSelection)
//        NSLayoutConstraint.activate([
//            typeSelection.topAnchor.constraint(equalTo: headerTypeSelection.bottomAnchor, constant: 10),
//            typeSelection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            typeSelection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            typeSelection.heightAnchor.constraint(equalToConstant: 31)])
//        
//        view.addSubview(discriptionLabel)
//        NSLayoutConstraint.activate([
//            discriptionLabel.topAnchor.constraint(equalTo: typeSelection.bottomAnchor, constant: 10),
//            discriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
//            discriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)])
//    }
//}
