//
//  TasksViewController.swift
//  MyCalendar
//
//  Created by Максим Боталов on 25.03.2022.
//

//import UIKit
//import RealmSwift
//
//class TasksViewController: UIViewController {
//    
//    private let cellTaskID: String = "cellTaskID"
//    
////    var tasks: Results<CalendarModel>!
//    
//    var tasksStorage = TasksStorage()
//    var tasks: [TaskModel.TaskType: [TaskModel]] = [:]
//    var sectionTypesPosition: [TaskModel.TaskType] = [.important, .current]
//    var sectionStatusPosition: [TaskModel.TaskStatus] = [.planned, .performed]
//    
//    let tasksTableView: UITableView = {
//        let tableView = UITableView()
//        tableView.separatorStyle = .singleLine
//        tableView.separatorInset = .init(top: 0, left: 15, bottom: 0, right: 15)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Задачи"
//        
//        tasksTableView.delegate = self
//        tasksTableView.dataSource = self
//        tasksTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 44))
//        tasksTableView.register(TaskCell.self, forCellReuseIdentifier: cellTaskID)
//        
//        settingConstraints()
//        loadTasks()
//        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newTaskTapped))
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Редактировать", style: .plain, target: self, action: #selector(editTableView))
//        
//        for (taskGroupType, taskGroup) in tasks {
//            tasks[taskGroupType] = taskGroup.sorted { task1, task2 in
//                task1.status.rawValue < task2.status.rawValue
//            }
//        }
//    }
//    
//    private func loadTasks() {
//        sectionTypesPosition.forEach { taksType in
//            tasks[taksType] = []
//        }
//        
//        tasksStorage.loadTask().forEach { task in
//            tasks[task.type]?.append(task)
//        }
//    }
//}
//
//extension TasksViewController {
//    @objc private func newTaskTapped() {
//        let vc = NewTaskController()
//        navigationController?.pushViewController(vc, animated: true)
//    }
//    
//    @objc private func editTableView(_ sender: UIBarButtonItem) {
//        let alert = UIAlertController(title: "Функционал на доработке", message: nil, preferredStyle: .alert)
//        let okeyAction = UIAlertAction(title: "Закрыть", style: .cancel, handler: nil)
//        alert.addAction(okeyAction)
//        present(alert, animated: true, completion: nil)
//    }
//}
//
//extension TasksViewController: UITableViewDataSource, UITableViewDelegate {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return tasks.count
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let taskType = sectionTypesPosition[section]
//        guard let currentTask = tasks[taskType] else { return 0 }
//        return currentTask.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tasksTableView.dequeueReusableCell(withIdentifier: cellTaskID, for: indexPath) as! TaskCell
//        let taskType = sectionTypesPosition[indexPath.section]
//        guard let currentTask = tasks[taskType]?[indexPath.row] else { return cell }
//        
//        cell.titleLabel.text = currentTask.title
//        cell.symbolLabel.text = congifSymbolForTask(with: currentTask.status)
//        
//        if currentTask.status == .planned {
//            cell.titleLabel.textColor = .black
//            cell.symbolLabel.textColor = .black
//        } else {
//            cell.titleLabel.textColor = .lightGray
//            cell.symbolLabel.textColor = .lightGray
//        }
//        
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let taskType = sectionTypesPosition[indexPath.section]
//        
//        guard let _ = tasks[taskType]?[indexPath.row] else { return nil }
//        guard tasks[taskType]![indexPath.row].status == .performed else { return nil }
//        
//        let action = UIContextualAction(style: .normal, title: "Не выполненна") { _, _, _ in
//            self.tasks[taskType]![indexPath.row].status = .planned
//            self.tasksTableView.reloadSections(IndexSet(arrayLiteral: indexPath.section), with: .automatic)
//        }
//        
//        return UISwipeActionsConfiguration(actions: [action])
//    }
//    
////    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
////        let taskType = sectionTypesPosition[indexPath.section]
////        let task = tasks[taskType]![indexPath.row]
////
////        let action = UIContextualAction(style: .destructive, title: "Удалить") { _, _, _ in
////            self.tasks.remove(at: task)
////        }
////    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let taskType = sectionTypesPosition[indexPath.section]
//        
//        guard let _ = tasks[taskType]?[indexPath.row] else { return }
//        
//        guard tasks[taskType]![indexPath.row].status == .planned else {
//            tableView.deselectRow(at: indexPath, animated: true)
//            return
//        }
//        
//        tasks[taskType]![indexPath.row].status = .performed
//        
//        tableView.reloadSections(IndexSet(arrayLiteral: indexPath.section), with: .automatic)
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "Важные"
//        } else {
//            return "Текущие"
//        }
//    }
//}
//
//extension TasksViewController {
//    private func congifSymbolForTask(with status: TaskModel.TaskStatus) -> String {
//        var symbol = String()
//        
//        if status == .planned {
//            symbol = "\u{25CB}"
//        } else {
//            symbol = "\u{25C9}"
//        }
//        
//        return symbol
//    }
//}
//
//extension TasksViewController {
//    private func settingConstraints() {
//        view.addSubview(tasksTableView)
//        
//        NSLayoutConstraint.activate([
//            tasksTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
//            tasksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            tasksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            tasksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)])
//    }
//}
