//
//  ViewController.swift
//  Link
//
//  Created by 장예진 on 5/21/24.
//

import UIKit
class ViewController : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuButton = UIButton(type: .system)
        var conf = UIButton.Configuration.filled()
        conf.title = "option"
        menuButton.configuration = conf
        menuButton.addAction(UIAction { [weak self] _ in
            self?.showMenu()
        }, for: .touchUpInside)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuButton)
        NSLayoutConstraint.activate([
            menuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func showMenu(){
        let alert = UIAlertController(title: "options", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title:"open",style: .default ){ _ in
            self.showMessage("open chasen")
        })
    }
    func showMessage(_ message: String){
        let alert = UIAlertController(title:message, message: nil, preferredStyle: .alert )
        alert.addAction(UIAlertAction(title:
                                        "OK", style: .default))
        present(alert, animated: true)
    }
}

