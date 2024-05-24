//
//  AddToDoViewController.swift
//  UIKitToDo
//
//  Created by 장예진 on 5/24/24.
//


import UIKit

protocol AddToDoViewControllerDelegate: AnyObject {
    func didAddToDo(_ toDo: ToDo)
    func didEditToDo(_ toDo: ToDo, at index: Int)
}


class AddToDoViewController: UIViewController {
    var textField: UITextField!
    var datePicker: UIDatePicker!
    var isRecurringSwitch: UISwitch!
    weak var delegate: AddToDoViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add ToDo"
        view.backgroundColor = .white
        setupNavigationBar()
        setupTextField()
        setupDatePicker()
        setupRecurringSwitch()
    }

    func setupNavigationBar() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem = cancelButton
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        navigationItem.rightBarButtonItem = saveButton
    }

    func setupTextField() {
        textField = UITextField()
        textField.placeholder = "Enter ToDo"
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    func setupRecurringSwitch() {
        let label = UILabel()
        label.text = "Repeat Weekly"
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20)
        ])

        isRecurringSwitch = UISwitch()
        view.addSubview(isRecurringSwitch)
        isRecurringSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            isRecurringSwitch.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10),
            isRecurringSwitch.centerYAnchor.constraint(equalTo: label.centerYAnchor)
        ])
    }

    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }

    @objc func save() {
        guard let text = textField.text, !text.isEmpty else { return }
        let toDo = ToDo(
            title: text,
            isCompleted: false,
            isFavorite: false,
            dueDate: datePicker.date,
            isRecurring: isRecurringSwitch.isOn
        )
        scheduleNotification(for: toDo)
        delegate?.didAddToDo(toDo)
        dismiss(animated: true, completion: nil)
    }

    func scheduleNotification(for toDo: ToDo) {
        let content = UNMutableNotificationContent()
        content.title = "Reminder"
        content.body = toDo.title
        content.sound = .default

        guard let dueDate = toDo.dueDate else { return }

        var triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: dueDate)

        if toDo.isRecurring {
            triggerDate.weekday = Calendar.current.component(.weekday, from: dueDate)
        }

        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: toDo.isRecurring)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
