//
//  ViewController.swift
//  Gesture
//
//  Created by 장예진 on 5/22/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let rectangle = UIView()
        rectangle.backgroundColor = .green
        rectangle.frame = CGRect(x: 100,y:100, width: 175, height: 125)
        rectangle.isUserInteractionEnabled   = true
        
        view.addSubview(rectangle)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hendleTap))\
        tapGesture.numberOfTapsRequired = 2
        rectangle.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer){
        if let view = sender.view {
            view.backgroundColor(view.backgroundColor == .green) ? .red : .green
        }
    }


}

