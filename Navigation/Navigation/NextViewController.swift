//
//  NextViewController.swift
//  Navigation
//
//  Created by 장예진 on 5/23/24.
//

import UIKit

protocol NextViewControllerDelegate {
    func save(animal: Animal)
}

class NextViewController: UIViewController {
    var animal: Animal?
    
    var delegate: NextViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "next page"
        
        let label = UILabel()
        label.text = animal?.name ?? "-"
        if let delegate = self.delegate {
            delegate.save(animal: Animal(name: "강아지"))
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        let button = UIButton(type: .custom)
        button.configuration = UIButton.Configuration.filled()
        button.setTitle("send", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction{ [ weak self] _ in
            if let delegate = self?.delegate {
                delegate.save(animal: self?.animal ?? Animal(name: "고라니"))
                self?.navigationController?.popViewController(animated: true)
            
            }
        }, for: .touchUpInside)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10)
        ])
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
