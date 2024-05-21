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

        let button = UIButton(type: .system)

        button.setTitleColor(.white, for : .normal)
        button.backgroundColor  = .systemBlue
        button.layer.cornerRadius = 10
        button.layer.borderWidth   = 2
        button.layer.borderColor = UIColor.white.cgColor
        //padding function
        button.contentEdgeInsets  = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.setTitle("Click me", for: .normal)
        //self 를 쓰기 위해 약한 참조를 사용하는 클로저 사용함 >
        // 여기서 안써도 되는 이유?  구문안에서 바깥쪽에있는 것을 표현하기 위해서 약한 참조를 쓰는것임 (아니라면 굳이?)
        button.addAction(UIAction{ [weak self] _ in
            self?.count += 1
            print("Button already tapped! \(self?.count ?? 0 )")}
                         , for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints   = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }


}

