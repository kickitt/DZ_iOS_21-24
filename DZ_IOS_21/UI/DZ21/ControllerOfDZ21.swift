//
//  ControllerOfDZ21.swift
//  DZ_IOS_21
//
//  Created by Roman Berezin on 27.05.2020.
//  Copyright © 2020 Roman Berezin. All rights reserved.
//

import UIKit
import SnapKit
import SDWebImage

class ControllerOfDZ21: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    let header = HeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))
    let footer = FooterView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0))
    
    override func setupController() {
        self.title = "Fonts"
        self.tabBarItem = UITabBarItem(title: "DZ21", image: UIImage(), tag: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OneCell.self, forCellReuseIdentifier: "Cell_id")
        
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        header.image.sd_setImage(with: URL(string: "https://cdn2.img.sputnik.az/images/41484/89/414848943.jpg"))
        header.label.text = "Deprecated. This method is only used for unwind segues whose destination view controller has been returned by an override of the deprecated method Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier"
        footer.label1.text = "Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:"
        footer.label2.text = "Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)"
        
        tableView.tableHeaderView = header
        tableView.tableFooterView = footer
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        resizeHeaderFooterView(for: self.view.frame.size)
    }
    
    //MARK: - Resize header \ footer view
    private func resizeHeaderFooterView(for size: CGSize) {
        
        // resize header view
        let headerSize = header.systemLayoutSizeFitting(CGSize(width: size.width, height: 0), withHorizontalFittingPriority: UILayoutPriority.required, verticalFittingPriority: UILayoutPriority.fittingSizeLevel)
        
        var tableHeaderViewFrame = tableView.tableHeaderView?.frame ?? .zero
        tableHeaderViewFrame.size.width = headerSize.width
        tableHeaderViewFrame.size.height = headerSize.height
        tableView.tableHeaderView?.frame = tableHeaderViewFrame
        
        // resize footer view
        let footerSize = footer.systemLayoutSizeFitting(CGSize(width: size.width, height: 0), withHorizontalFittingPriority: UILayoutPriority.required, verticalFittingPriority: UILayoutPriority.fittingSizeLevel)
        
        var tableFooterViewFrame = tableView.tableFooterView?.frame ?? .zero
        tableFooterViewFrame.size.width = footerSize.width
        tableFooterViewFrame.size.height = footerSize.height
        tableView.tableFooterView?.frame = tableFooterViewFrame
        
        header.makingConstraints()
        footer.makingConstraints()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        resizeHeaderFooterView(for: size)
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return UIFont.familyNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let familyNames = UIFont.familyNames
        let familyName = familyNames[section]
        let fontNames = UIFont.fontNames(forFamilyName: familyName)
        return fontNames.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let familyNames = UIFont.familyNames
        let familyName = familyNames[section]
        return familyName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let familyNames = UIFont.familyNames
        let familyName = familyNames[indexPath.section]
        let fontNames = UIFont.fontNames(forFamilyName: familyName)
        let fontName = fontNames[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_id", for: indexPath)
        cell.textLabel?.text = "\(fontName)"
        let font = UIFont(name: fontName, size: 16)
        cell.textLabel?.font = font
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}
