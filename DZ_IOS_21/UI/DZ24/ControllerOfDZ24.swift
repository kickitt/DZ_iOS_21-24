//
//  ControllerOfDZ24.swift
//  DZ_IOS_21
//
//  Created by Roman Berezin on 27.05.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class ControllerOfDZ24: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    var dataSource = DataProvider.shared.getEmptyArray()
    
    override func setupController() {
        self.title = "Add/Remove cells"
        self.tabBarItem = UITabBarItem.init(title: "DZ24", image: UIImage(), tag: 3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed))
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.isEditing = true
        tableView.register(TwentyFourCell.self, forCellReuseIdentifier: "TwentyFourCell")
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalTo(self.view).inset(0)
        }
    }
    
    //MARK: - Actions
    
    @objc func addButtonPressed() {
        var i = 2
        let index = 0
        let insertIndex = index <= dataSource[0].count ? index : dataSource[0].count
        while i != 0 {
            dataSource[0].insert(String(Int.random(in: 0...100)), at: insertIndex)
            let indexPath = IndexPath(row: insertIndex, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
            i -= 1
        }
    }
    
    //MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(String(dataSource.index(dataSource.startIndex, offsetBy: section) + 1))"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TwentyFourCell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.section][indexPath.row]
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section == 0 {
            return false
        } else  {
            return true
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataSource[1].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
