//
//  ViewController.swift
//  Navigation
//
//  Created by 장예진 on 5/23/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 둘 다 가능
//        self.navigationItem.title = "navigation title"
        
        self.title = "navigation title"
        // optional value
        self.navigationController?.navigationBar.barStyle = .default
        // 상단 과 상태바의 간격 설정
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.backgroundColor = .systemBrown
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let leftButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(leftButtonTapped))
        self.navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(rightButtonTapped))
        let extraButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(extraButtonTapped))
        
        self.navigationItem.rightBarButtonItems = [rightButton, extraButton]
        
        
        let button = UIButton(type: .system)
        button.setTitle("next page", for: .normal)
        button.addAction(UIAction { [ weak self] _ in
            let nextViewController = UIViewController()
            self?.show(nextViewController, sender: nil)
        }, for: .touchUpInside)
        
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.addSubview(button)
    }
    // 연결되게 하려면 여기에 다른걸 link 하면 되겠지?
    
    @objc func leftButtonTapped() {
        print("왼쪽 버튼 탭됨")
    }

    @objc func rightButtonTapped() {
        print("오른쪽 버튼 탭됨")
    }

    @objc func extraButtonTapped() {
        print("추가 버튼 탭됨")
    }

}
