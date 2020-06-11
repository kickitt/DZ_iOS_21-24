//
//  ControllerOfDZ22.swift
//  DZ_IOS_21
//
//  Created by Roman Berezin on 27.05.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class ControllerOfDZ22: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    let dataSource = DataProvider.shared.getCommentModel()
    
    override func setupController() {
        super.setupController()
        
        self.title = "Comments"
        self.tabBarItem = UITabBarItem(title: "DZ22", image: UIImage(), tag: 1)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TwentyTwoCell.self, forCellReuseIdentifier: "TwentyTwoCell")
        
        
        tableView.snp.makeConstraints { maker in
            maker.edges.equalTo(self.view).inset(0)
        }
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TwentyTwoCell", for: indexPath)
        if let cell = cell as? TwentyTwoCell {
            cell.model = model
        }
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
