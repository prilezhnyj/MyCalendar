//
//  BirthdaysCell.swift
//  MyCalendar
//
//  Created by Максим Боталов on 27.03.2022.
//

import UIKit

class BirthdaysCell: UITableViewCell {
    
    var userImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Photo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let birthdayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let oldOfYearsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
            self.settingConstraints()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userImage.clipsToBounds = translatesAutoresizingMaskIntoConstraints
        self.userImage.layer.cornerRadius = self.userImage.frame.height / 2
    }
}

// MARK: - SettingConstraints

extension BirthdaysCell {
    private func settingConstraints() {
        let stackViewCell = UIStackView(arrangedSubviews: [nameLabel, birthdayLabel, oldOfYearsLabel], distribution: .fillEqually, axis: .vertical, spacing: 0)
        
        self.addSubview(userImage)
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            userImage.heightAnchor.constraint(equalToConstant: 60),
            userImage.widthAnchor.constraint(equalToConstant: 60)])
        
        self.addSubview(stackViewCell)
        NSLayoutConstraint.activate([
            stackViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            stackViewCell.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 15),
            stackViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            stackViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)])
    }
}
