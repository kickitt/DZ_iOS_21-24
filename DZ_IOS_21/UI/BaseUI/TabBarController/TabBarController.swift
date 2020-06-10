//
//  TabBarController.swift
//  DZ_IOS_21
//
//  Created by Roman Berezin on 27.05.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        self.tabBar.tintColor = .black
        
        let dz21 = NavController(rootViewController: ControllerOfDZ21())
        let dz22 = NavController(rootViewController: ControllerOfDZ22())
        let dz23 = NavController(rootViewController: ControllerOfDZ23())
        let dz24 = NavController(rootViewController: ControllerOfDZ24())
        
        self.viewControllers = [dz21, dz22, dz23, dz24]
        self.selectedIndex = 0
    }
}

extension TabBarController: UITabBarControllerDelegate {
    
}
