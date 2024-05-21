//
//  ViewController.swift
//  SegmentedControl
//
//  Created by 장예진 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .custom)
        // layer를 직접 access 하는 방식( 밑의 것은 config 를 씌운것) 
//        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .systemBlue
//        button.layer.cornerRadius = 10
//        button.layer.borderWidth = 2
//        button.layer.borderColor = UIColor.white.cgColor
        var config = UIButton.Configuration.filled()
        
        config.title = "Click me"
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule

        
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        button.configuration = config
        
//        button.setTitle("Click me", for: .normal)
        button.addAction(UIAction { [weak self] _ in
            self?.count += 1
            print("Button was tapped! \(self?.count ?? 0)")
        }, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

