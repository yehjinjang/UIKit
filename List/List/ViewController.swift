//
//  ViewController.swift
//  List
//
//  Created by 장예진 on 5/22/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

     let items = ["cat","dog","bird","fish","reptile"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default,
                                                                                            reuseIdentifier: "cell")
        var config = cell.defaultContentConfiguration()
        return cell
    }

}

