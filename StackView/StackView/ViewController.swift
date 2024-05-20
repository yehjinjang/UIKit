//
//  ViewController.swift
//  StackView
//
//  Created by 장예진 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        let  topLabel = UILabel()
        topLabel.text = "top"
        topLabel.textAlignment = .center
        topLabel.backgroundColor = .lightGray
        
        let leftLabel = UILabel()
        leftLabel.text = "left"
        leftLabel.textAlignment = .center
        leftLabel.backgroundColor = .lightGray
                
        let rightLabel = UILabel()
        rightLabel.text = "right"
        rightLabel.textAlignment = .center
        rightLabel.backgroundColor = .lightGray
        
        let hStackView = UIStackView(arrangedSubviews: [leftLabel, rightLabel])
        hStackView.axis = .horizontal
        hStackView.spacing = 10
        
        stackView.addArrangedSubview(topLabel)
        stackView.addArrangedSubview(hStackView)
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        

    }


}

