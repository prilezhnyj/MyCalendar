//
//  NewBirthdayController.swift
//  MyCalendar
//
//  Created by Максим Боталов on 27.03.2022.
//

import UIKit

class NewBirthdayController: UIViewController {
    
    var delegateBirthday: CalendarNewBirthdayProtocol!
    
    let defaultImageUser = UIImage(named: "defaultImageUser")
    
    let headerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя Фамилия"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя и фамилию"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let headerDateLabel: UILabel = {
        let label = UILabel()
        label.text = "День рождения"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите дату дня рождения"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let addPhotoLabel: UILabel = {
        let label = UILabel()
        label.text = "Добавьте фотографию"
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addPhotoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Добавить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    let addPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Добавить день рождения"
        
        settingConstraints()
        
        addPhotoImageView.isHidden = true
    
        addPhotoButton.addTarget(self, action: #selector(addPhotoTapped), for: .touchUpInside)
        dateTextField.addTarget(self, action: #selector(changeDate), for: .allEvents)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveBirthday))
    }
}


// MARK: - Methods & @objc

extension NewBirthdayController {
    
    @objc private func saveBirthday(_ sender: UIBarButtonItem) {
        delegateBirthday.newBirthday(image: addPhotoImageView.image ?? defaultImageUser!, name: nameTextField.text!, date: dateTextField.text!)
        navigationController?.popViewController(animated: true)
        print("Сохраняю день рождения")
    }
    
    @objc private func addPhotoTapped() {
        alertAddPhoto { source in
            self.chooseImagePicker(source)
        }
    }
    
    @objc private func changeDate() {
        alertDate { date in
            self.dateTextField.text = date
        }
    }
}

extension NewBirthdayController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(_ source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        addPhotoImageView.image = info[.editedImage] as? UIImage
        dismiss(animated: true, completion: nil)
        addPhotoImageView.isHidden = false
    }
}


// MARK: - SettingConstraints

extension NewBirthdayController {
    private func settingConstraints() {
        
        view.addSubview(headerNameLabel)
        NSLayoutConstraint.activate([
            headerNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            headerNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            headerNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            headerNameLabel.heightAnchor.constraint(equalToConstant: 21)])
        
        view.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: headerNameLabel.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            nameTextField.heightAnchor.constraint(equalToConstant: 34)])
        
        view.addSubview(headerDateLabel)
        NSLayoutConstraint.activate([
            headerDateLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30),
            headerDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            headerDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            headerDateLabel.heightAnchor.constraint(equalToConstant: 21)])
        
        view.addSubview(dateTextField)
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: headerDateLabel.bottomAnchor, constant: 10),
            dateTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dateTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dateTextField.heightAnchor.constraint(equalToConstant: 34)])
        
        view.addSubview(addPhotoLabel)
        NSLayoutConstraint.activate([
            addPhotoLabel.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 30),
            addPhotoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            addPhotoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            addPhotoLabel.heightAnchor.constraint(equalToConstant: 21)])
        
        
        view.addSubview(addPhotoButton)
        NSLayoutConstraint.activate([
            addPhotoButton.centerYAnchor.constraint(equalTo: addPhotoLabel.centerYAnchor),
            addPhotoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            addPhotoButton.heightAnchor.constraint(equalToConstant: 22),
            addPhotoButton.widthAnchor.constraint(equalToConstant: 81)
        ])
        
        view.addSubview(addPhotoImageView)
        NSLayoutConstraint.activate([
            addPhotoImageView.topAnchor.constraint(equalTo: addPhotoLabel.bottomAnchor, constant: 30),
            addPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            addPhotoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            addPhotoImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -83)])
    }
}
