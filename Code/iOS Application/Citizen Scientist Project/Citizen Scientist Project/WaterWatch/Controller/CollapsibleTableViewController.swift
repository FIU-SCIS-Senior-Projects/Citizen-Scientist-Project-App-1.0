//
//  CollapsibleTableViewController.swift
//  Citizen-Scientist-Project
//
//  Created by David Gonzalez on 3/22/18.
//  Copyright © 2018 Key Biscayne. All rights reserved.
//

import UIKit

//
// MARK: - View Controller
//
class CollapsibleTableViewController: UITableViewController {
    
    var sections = sectionsData
    
    static weak var delegate: WaterWatchContainerViewDelegate?
    
    var tableViewHeight: CGFloat {
        tableView.layoutIfNeeded()
        return tableView.contentSize.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Disable tableview scrolling
        //tableView.isScrollEnabled = false
        
        // Auto resizing the height of the cell
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.sectionFooterHeight = UITableViewAutomaticDimension
        
        tableView.backgroundColor = UIColor.blue
        
//        // Hide additional empty rows in tableView
//        tableView.tableFooterView = UIView()
        
//        self.size
        
        //self.title = "Apple Products"
    }
    
}

//
// MARK: - View Controller DataSource and Delegate
//
extension CollapsibleTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].collapsed ? 0 : sections[section].items.count
    }
    
    // Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CollapsibleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CollapsibleTableViewCell ??
            CollapsibleTableViewCell(style: .default, reuseIdentifier: "cell")
        
        let item = sections[indexPath.section].items[indexPath.row]
        
        cell.chartTitle.text = item.title
        cell.chartImageView.image = UIImage(named: item.chartImage)
        cell.legendImageView.image = UIImage(named: item.legendImage)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        header.titleLabel.text = sections[section].header
        header.arrowLabel.text = ">"
        header.setCollapsed(sections[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
}

//
// MARK: - Section Header Delegate
//
extension CollapsibleTableViewController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        
//        var height = tableViewHeight
//        CollapsibleTableViewController.delegate?.setContainerHeight(height: 5000)
        
        //
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
        
        
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        
        // change container height after reloading the sections
        //DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            // Put your code which should be executed with a delay here
            let height = self.tableViewHeight
            CollapsibleTableViewController.delegate?.setContainerHeight(height: height)
        //})
        
    }
    
}
