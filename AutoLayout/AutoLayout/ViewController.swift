//
//  ViewController.swift
//  AutoLayout
//
//  Created by 장예진 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let label = UILabel()
//        label.text  = "Hello, autolayout"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(label)
//        
//        //        NSLayoutConstraint.activate([
//        //            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        //            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        //        ])
//        // 위의 코드랑 같은 기능 더 간결하게 할수 있음
//        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        //      화면 상단 상태바나 하단 홈 핸들에 겹치지 않는 영역으로 위치시킬때 사용하는 가이드라인 safeAreaLayoutGuide
//        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
//        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
//        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
//        label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
//        //      제약조건 하나하나 isActive 프로퍼티 설정하는 대신, activate 함수로 한번에 활성화 할 수 있다.
//        //        NSLayoutConstraint.activate([
//        //            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        //            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        //        ])
        
        let box = UIView()
        box.backgroundColor = .red
        box.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(box)
        
        NSLayoutConstraint.activate([
            box.widthAnchor.constraint(equalToConstant: 100),
            box.heightAnchor.constraint(equalToConstant: 100),
            
            
            box.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            box.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //최솟값 정의
            box.widthAnchor.constraint(lessThanOrEqualToConstant: 200)
            // 최댓값 정의 
        ])
    }
    
    
}
