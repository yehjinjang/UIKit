//
//  ViewController.swift
//  Link
//
//  Created by 장예진 on 5/21/24.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let linkButton = UIButton(type: .system)
        var conf = UIButton.Configuration.filled()
        conf.title = "Apple"
        linkButton.configuration = conf
        linkButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        
        linkButton.addAction(UIAction { _ in
            if let url = URL(string:"https://www.apple.com") {
                UIApplication.shared.open(url)
            }
        }, for: .touchUpInside)
        
        view.addSubview(linkButton)
        
        NSLayoutConstraint.activate([
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }
}
