//
//  TableViewDataSource.swift
//  rip-harambe-workout-tracker
//
//  Created by Chandler De Angelis on 7/27/17.
//  Copyright © 2017 Chandler De Angelis. All rights reserved.
//

import Foundation
import UIKit

open class TableViewDataSource: NSObject {
    
    open weak var viewController: UIViewController?
    
    open var sections: [TableViewSection]
    open weak var tableView: UITableView?
    
    public init(sections: [TableViewSection]) {
        self.sections = sections
        super.init()
    }
    
    open func registerCells(with tableView: UITableView) {
        self.tableView = tableView
    }
}
// MARK: - UITableViewDataSource
extension TableViewDataSource: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection: TableViewSection = self.sections[section]
        return currentSection.rowCount
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSection: TableViewSection = self.sections[indexPath.section]
        return currentSection.cell(for: indexPath, in: tableView)
    }
}

