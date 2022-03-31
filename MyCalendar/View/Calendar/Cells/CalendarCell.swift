//
//  CalendarCell.swift
//  MyCalendar
//
//  Created by Максим Боталов on 27.03.2022.
//

import UIKit

class CalendarCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let timeLabel: UILabel = {
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
}

// MARK: - SettingConstraints

extension CalendarCell {
    private func settingConstraints() {
        let stackViewCell = UIStackView(arrangedSubviews: [titleLabel, dateLabel, timeLabel], distribution: .fillEqually, axis: .vertical, spacing: 0)
        
        self.addSubview(stackViewCell)
        NSLayoutConstraint.activate([
            stackViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            stackViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            stackViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            stackViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)])
    }
}

