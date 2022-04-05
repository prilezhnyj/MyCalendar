//
//  TaskCell.swift
//  MyCalendar
//
//  Created by Максим Боталов on 31.03.2022.
//

import UIKit

class TaskCell: UITableViewCell {
    let symbolLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textAlignment = .left
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

extension TaskCell {
    func settingConstraints() {
        
        self.addSubview(symbolLabel)
        NSLayoutConstraint.activate([
            symbolLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            symbolLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            symbolLabel.widthAnchor.constraint(equalToConstant: 25),
            symbolLabel.heightAnchor.constraint(equalToConstant: 25)])
        
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: symbolLabel.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15)])
    }
}
