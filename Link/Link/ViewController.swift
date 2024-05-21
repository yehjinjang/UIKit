//
//  ViewController.swift
//  Link
//
//  Created by 장예진 on 5/21/24.
//

import UIKit
import WebKit
import SafariServices

class ViewController: UIViewController {g
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.isHidden = true
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let linkButton = UIButton(type: .system)
        var conf = UIButton.Configuration.filled()
        conf.title = "Apple"
        linkButton.configuration = conf
        linkButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        
        linkButton.addAction(UIAction { [weak self] _ in
            if let url = URL(string:"https://www.apple.com") {
//                UIApplication.shared.open(url)
                let safariViewController = SFSafariViewController(url: url)
                // 다양한 형태의 모달 뷰로 띄울 수 있다.
                safariViewController.modalPresentationStyle = .pageSheet
                self?.present(safariViewController, animated: true)
//                self?.openInWebView(url: url)
            }
        }, for: .touchUpInside)
        
        view.addSubview(linkButton)
        view.addSubview(webView)

        NSLayoutConstraint.activate([
            linkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func openInWebView(url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
        webView.isHidden = false
    }
}
