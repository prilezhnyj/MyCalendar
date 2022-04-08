//
//  CalendarController.swift
//  MyCalendar
//
//  Created by Максим Боталов on 25.03.2022.
//

import UIKit
import FSCalendar
import RealmSwift

class CalendarController: UIViewController {
    
    var events: Results<CalendarModel>!
    var birthdays: Results<BirthdayModel>!
    
    private var calendarHeightConstraint: NSLayoutConstraint!
    
    private var titleDelegate: String!
    private var dateDelegate: String!
    private var timeDelegate: String!
    
    private var imageBirthdayDelegate: UIImage!
    private var nameBirthdayDelegate: String!
    private var dateBirthdayDelegate: String!
    
    private let cellCalendarID: String = "cellCalendarID"
    private let cellBirthdayID: String = "cellBirthdayID"
    
    private var isEditingChange: Bool = false
    
    let calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.firstWeekday = 2
        calendar.appearance.headerDateFormat = "MMMM yyyy"
        calendar.translatesAutoresizingMaskIntoConstraints = false
        return calendar
    }()
    
    let showCalendarButton: UIButton = {
        let button = UIButton()
        button.setTitle("Развернуть календарь", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let choiceSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["События", "Дни рождения"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Календарь"
        view.backgroundColor = .white
        settingConstraints()
        
        events = realm.objects(CalendarModel.self)
        birthdays = realm.objects(BirthdayModel.self)
        
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scope = .week
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CalendarCell.self, forCellReuseIdentifier: cellCalendarID)
        tableView.register(BirthdaysCell.self, forCellReuseIdentifier: cellBirthdayID)
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newEventCreate))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Редактировать", style: .plain, target: self, action: #selector(editTableView))
        
        showCalendarButton.addTarget(self, action: #selector(showCalendarButtonTapped), for: .touchUpInside)
        choiceSegmentedControl.addTarget(self, action: #selector(choiceSegmentedControlAction), for: .valueChanged)
    }
}

// MARK: - Methods & @objc

extension CalendarController {
    
    @objc private func showCalendarButtonTapped() {
        if calendar.scope == .week {
            calendar.setScope(.month, animated: true)
            showCalendarButton.setTitle("Свернуть календарь", for: .normal)
            showCalendarButton.setTitleColor(.systemRed, for: .normal)
        } else {
            calendar.setScope(.week, animated: true)
            showCalendarButton.setTitle("Развернуть календарь", for: .normal)
            showCalendarButton.setTitleColor(.black, for: .normal)
        }
    }
    
    @objc private func newEventCreate() {
        let selectedIndex = choiceSegmentedControl.selectedSegmentIndex
        
        if selectedIndex == 0 {
            let nextViewController = NewEventController()
            nextViewController.delelete = self
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            let nextViewController = NewBirthdayController()
            nextViewController.delegateBirthday = self
            navigationController?.pushViewController(nextViewController, animated: true)
        }
        
    }
    
    @objc private func editTableView(_ sender: UIBarButtonItem) {
        alertUnavailable()
    }
    
    @objc private func choiceSegmentedControlAction() {
        tableView.reloadData()
    }
}


// MARK: - Protocols

extension CalendarController: CalendarNewEventProtocol {
    
    func newEventUpdate(title: String, date: String, time: String) {
        titleDelegate = title
        dateDelegate = date
        timeDelegate = time
        let newEvent = CalendarModel(title: titleDelegate, date: dateDelegate, time: timeDelegate)
        CalendarStorageManager.saveEvent(newEvent)
        tableView.reloadData()
    }
}

extension CalendarController: CalendarNewBirthdayProtocol {
    
    func newBirthday(image: UIImage, name: String, date: String) {
        imageBirthdayDelegate = image
        nameBirthdayDelegate = name
        dateBirthdayDelegate = date
        
        let imageData = imageBirthdayDelegate.pngData()
        let newBirthday = BirthdayModel(image: imageData!, name: nameBirthdayDelegate, date: dateBirthdayDelegate)
        CalendarBirthdayStorageManager.saveEvent(newBirthday)
        tableView.reloadData()
    }
}


// MARK: - UITableViewDelegate & UITableViewDataSource

extension CalendarController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let selectedIndex = choiceSegmentedControl.selectedSegmentIndex
        switch selectedIndex {
        case 0: return events.isEmpty ? 0 : events.count
        case 1: return birthdays.isEmpty ? 0 : birthdays.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selectedIndex = choiceSegmentedControl.selectedSegmentIndex
        
        
        
        if selectedIndex == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellCalendarID, for: indexPath) as! CalendarCell
            
            tableView.separatorInset = .init(top: 0, left: 15, bottom: 0, right: -15)
            
            let oneEvent = events[indexPath.row]
            cell.titleLabel.text = oneEvent.title
            cell.dateLabel.text = "Дата: " + oneEvent.date
            cell.timeLabel.text = "Время: " + oneEvent.time
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellBirthdayID, for: indexPath) as! BirthdaysCell
            let oneBirthday = birthdays[indexPath.row]
            
            tableView.separatorInset = .init(top: 0, left: 90, bottom: 0, right: -15)
            
            let data = oneBirthday.image
            let image = UIImage(data: data!)
            
            cell.nameLabel.text = oneBirthday.name
            cell.userImage.image = image!
            cell.birthdayLabel.text = "День рождения: " + oneBirthday.date
            cell.oldOfYearsLabel.text = "Функция нeдоступна"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let selectedIndex = choiceSegmentedControl.selectedSegmentIndex
        
        switch selectedIndex {
        case 0: return 100
        case 1: return 80
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let selectedIndex = choiceSegmentedControl.selectedSegmentIndex
        
        if selectedIndex == 0 {
            let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, _ in
                let oneEvent = self.events[indexPath.row]
                CalendarStorageManager.deleteEvent(oneEvent)
                self.tableView.reloadData()
            }
            return UISwipeActionsConfiguration(actions: [deleteAction])
        } else {
            let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, _ in
                let oneBirthday = self.birthdays[indexPath.row]
                CalendarBirthdayStorageManager.deleteBirthday(oneBirthday)
                self.tableView.reloadData()
            }
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedIndex = choiceSegmentedControl.selectedSegmentIndex
        
        if selectedIndex == 0 {
            alertNoAccess()
        }
    }
}


// MARK: - FSCalendarDelegate & FSCalendarDataSource

extension CalendarController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        calendarHeightConstraint.constant = bounds.height
        view.layoutIfNeeded()
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(date)
    }
}


// MARK: - SettingConstraints

extension CalendarController {
    private func settingConstraints() {
        view.addSubview(calendar)
        
        calendarHeightConstraint = NSLayoutConstraint(item: calendar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        calendar.addConstraint(calendarHeightConstraint)
        
        NSLayoutConstraint.activate([
            calendar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            calendar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calendar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)])
        
        view.addSubview(showCalendarButton)
        NSLayoutConstraint.activate([
            showCalendarButton.topAnchor.constraint(equalTo: calendar.bottomAnchor, constant: 0),
            showCalendarButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            showCalendarButton.heightAnchor.constraint(equalToConstant: 17),
            showCalendarButton.widthAnchor.constraint(equalToConstant: 152)])
        
        view.addSubview(choiceSegmentedControl)
        NSLayoutConstraint.activate([
            choiceSegmentedControl.topAnchor.constraint(equalTo: showCalendarButton.bottomAnchor, constant: 15),
            choiceSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            choiceSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            choiceSegmentedControl.heightAnchor.constraint(equalToConstant: 31)])
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: choiceSegmentedControl.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)])
    }
}
