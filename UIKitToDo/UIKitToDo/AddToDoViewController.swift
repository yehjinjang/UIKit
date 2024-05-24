//
//  AddToDoViewController.swift
//  UIKitToDo
//
//  Created by 장예진 on 5/24/24.
//


import UIKit

protocol AddToDoViewControllerDelegate: AnyObject {
    func didAddToDo(_ toDo: ToDo)
}

class AddToDoViewController: UIViewController {
    var textField: UITextField!
    weak var delegate: AddToDoViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add To-Do"
        view.backgroundColor = .white
        setupNavigationBar()
        setupTextField()
    }

    func setupNavigationBar() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem = cancelButton
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        navigationItem.rightBarButtonItem = saveButton
    }

    func setupTextField() {
        textField = UITextField()
        textField.placeholder = "Insert To-Do"
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }

    @objc func save() {
        guard let text = textField.text, !text.isEmpty else { return }
        let toDo = ToDo(title: text, isCompleted: false, isFavorite: false)
        delegate?.didAddToDo(toDo)
        dismiss(animated: true, completion: nil)
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
