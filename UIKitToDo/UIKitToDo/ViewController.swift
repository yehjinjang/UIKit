//
//  ViewController.swift
//  UIKitToDo
//
//  Created by 장예진 on 5/24/24.
//

import UIKit
import UserNotifications

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var tableView: UITableView!
    var todos: [ToDo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "To-Do List"
        setupTableView()
        setupNavigationBar()
        loadData()
        requestNotificationAuthorization()
    }

    func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ToDoCell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToDo))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func addToDo() {
        let addVC = AddToDoViewController()
        addVC.delegate = self
        let navController = UINavigationController(rootViewController: addVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }

    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "todos"),
           let savedTodos = try? JSONDecoder().decode([ToDo].self, from: data) {
            todos = savedTodos
        }
        todos.sort(by: { ($0.dueDate ?? Date.distantFuture) < ($1.dueDate ?? Date.distantFuture) })
    }

    func saveData() {
        if let data = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(data, forKey: "todos")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        let toDo = todos[indexPath.row]
        cell.textLabel?.text = toDo.isFavorite ? "⭐️ " + toDo.title : toDo.title
        if let dueDate = toDo.dueDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            cell.detailTextLabel?.text = formatter.string(from: dueDate)
        } else {
            cell.detailTextLabel?.text = ""
        }
        cell.accessoryType = toDo.isCompleted ? .checkmark : .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = todos[indexPath.row]
        let editVC = AddToDoViewController()
        editVC.delegate = self
        editVC.textField.text = toDo.title
        editVC.datePicker.date = toDo.dueDate ?? Date()
        editVC.isRecurringSwitch.isOn = toDo.isRecurring
        let navController = UINavigationController(rootViewController: editVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    // 오른쪽 스와이프 액션 - 삭제
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            self.todos.remove(at: indexPath.row)
            self.saveData()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    // 왼쪽 스와이프 액션 - 즐겨찾기
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favoriteAction = UIContextualAction(style: .normal, title: "Favorite") { (action, view, completionHandler) in
            self.todos[indexPath.row].isFavorite.toggle()
            self.todos.sort(by: { $0.isFavorite && !$1.isFavorite })
            self.saveData()
            self.tableView.reloadData()
            completionHandler(true)
        }
        favoriteAction.backgroundColor = .systemYellow
        
        return UISwipeActionsConfiguration(actions: [favoriteAction])
    }

    func requestNotificationAuthorization() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if let error = error {
                print("Notification authorization error: \(error)")
            }
        }
    }
}

extension MainViewController: AddToDoViewControllerDelegate {
    func didAddToDo(_ toDo: ToDo) {
        todos.append(toDo)
        todos.sort(by: { ($0.dueDate ?? Date.distantFuture) < ($1.dueDate ?? Date.distantFuture) })
        saveData()
        tableView.reloadData()
    }

    func didEditToDo(_ toDo: ToDo, at index: Int) {
        todos[index] = toDo
        todos.sort(by: { ($0.dueDate ?? Date.distantFuture) < ($1.dueDate ?? Date.distantFuture) })
        saveData()
        tableView.reloadData()
    }
}
