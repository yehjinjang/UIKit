//
//  ViewController.swift
//  Picker
//
//  Created by 장예진 on 5/21/24.
//


import UIKit

class ViewController: UIViewController {
    
    let datePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints  = false
        return picker
    } ()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let today = Date()
        var dateComponents  = DateComponents()
        dateComponents.year = 1
        // 날 짜 컴포넌트의 일년 개념을 달력에 넣어줌
        let oneYearFromNow = Calendar.current.date(byAdding: dateComponents, to : today)
        
        datePicker.minimumDate = today
        datePicker.maximumDate = oneYearFromNow
        
        datePicker.addAction(UIAction{ [weak self] _ in
            print("Sender: \(self?.datePicker.date.formatted() ?? "N/A")")
        }, for : .valueChanged)
        
        
        view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
}
