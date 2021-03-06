//
//  MainMenuViewController.swift
//  UltimateTest
//
//  Created by SMILEY-ANDREWS, Simon on 6/3/18.
//  Copyright © 2018 SMILEY-ANDREWS, Simon. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    let model: MainMenuModel = MainMenuModel()
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.getNumberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = model.getTitle(for: indexPath)
        return cell!
    }
}
