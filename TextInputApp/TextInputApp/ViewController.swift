//
//  ViewController.swift
//  TextInputApp
//
//  Created by 장예진 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var secureTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        displayLabel.text = ""
        
        textField.borderStyle = .roundedRect
        secureTextField.borderStyle = .roundedRect
        
        textField.keyboardType = .emailAddress
        secureTextField.isSecureTextEntry = true
        
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 5.0
        textView.font = UIFont.systemFont(ofSize: 16.0)

    }

    @IBAction func didTapSubmitButton(_ sender: Any) {
        let textFieldText = textField.text ?? ""
        let secureTextFieldText = secureTextField.text ?? ""
        let textViewText = textView.text ?? ""
        
        displayLabel.text = "TextField: \(textFieldText)\nSecureField: \(secureTextFieldText)\nTextView: \(textViewText)"
        
        textField.text = ""
        secureTextField.text = ""
        textView.text = ""
    }
    
}

extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Enter your text here..."
            textView.textColor = UIColor.lightGray
        }
    }
}
