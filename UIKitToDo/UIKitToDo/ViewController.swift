//
//  ViewController.swift
//  UIKitToDo
//
//  Created by 장예진 on 5/24/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tableView: UITableView!
    var todos : [ToDo] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "To-Do List"
        setupTableView()
        setupNavigationBar()
        loadData()
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
        navController.modalPresentationStyle = .fullScreen // 모달 표시 스타일 설정
        present(navController, animated: true, completion: nil)
    }

    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "todos"),
           let savedTodos = try? JSONDecoder().decode([ToDo].self, from: data) {
            todos = savedTodos
        }
    }

    func saveData() {
        if let data = try? JSONEncoder().encode(todos) {
            UserDefaults.standard.set(data, forKey: "todos")
        }
    }

    // UITableViewDataSource methods here
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        let toDo = todos[indexPath.row]
        cell.textLabel?.text = toDo.title
        cell.accessoryType = toDo.isCompleted ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todos[indexPath.row].isCompleted.toggle()
        saveData()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            saveData()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension MainViewController: AddToDoViewControllerDelegate {
    func didAddToDo(_ toDo: ToDo) {
        todos.append(toDo)
        saveData()
        tableView.reloadData()
    }
}
