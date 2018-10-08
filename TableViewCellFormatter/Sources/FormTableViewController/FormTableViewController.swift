//
//  FormTableViewController.swift
//  TableViewCellFormatter
//
//  Created by Chandler De Angelis on 5/14/18.
//  Copyright © 2018 Chandler De Angelis. All rights reserved.
//

import Foundation

open class FormTableViewController: UIViewController, UITableViewDelegate {
    
    // MARK: Properties
    
    public private(set) lazy var tableView: UITableView = {
        let result: UITableView = UITableView()
        result.estimatedRowHeight = 50
        result.rowHeight = UITableView.automaticDimension
        result.separatorStyle = .none
        return result
    }()
    
    public let tableDataSource: TableViewDataSource
    
    // MARK: Init
    
    public init(tableDataSource: TableViewDataSource) {
        self.tableDataSource = tableDataSource
        super.init(nibName: .none, bundle: .none)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: View Lifecycles
    
    override open func loadView() {
        self.view = self.tableView
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self.tableDataSource
        self.tableView.delegate = self
        self.tableDataSource.registerCells(with: self.tableView)
    }
    
    // MARK: UITableViewDelegate
    
    open func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.section < self.tableDataSource.sections.endIndex else { return }
        let section: TableViewSection = self.tableDataSource.sections[indexPath.section]
        section.willDisplay(cell: cell, at: indexPath)
    }
    
    open func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.section < self.tableDataSource.sections.endIndex else { return }
        let section: TableViewSection = self.tableDataSource.sections[indexPath.section]
        section.didEndDisplaying(cell: cell, at: indexPath)
    }
}
