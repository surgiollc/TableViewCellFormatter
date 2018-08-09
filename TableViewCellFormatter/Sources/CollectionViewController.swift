//
//  CollectionViewController.swift
//  TableViewCellFormatter
//
//  Created by Chandler De Angelis on 6/3/18.
//  Copyright © 2018 Chandler De Angelis. All rights reserved.
//

import Foundation
import UIKit

open class CollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    public let _dataSource: CollectionViewDataSource
    
    // MARK: - Init
    
    public init(layout: UICollectionViewLayout, dataSource: CollectionViewDataSource) {
        self._dataSource = dataSource
        super.init(collectionViewLayout: layout)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.flatMap(self._dataSource.registerCells)
    }
    
    // MARK: - UICollectionViewDataSource
    
    open override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self._dataSource.numberOfSections(in: collectionView)
    }
    
    open override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self._dataSource.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    open override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self._dataSource.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    // MARK: - UICollectionViewDelegate
    
    open override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let section: CollectionViewSection = self._dataSource.sections[indexPath.section]
        section.willDisplay(cell: cell, at: indexPath)
    }
    
    open override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let section: CollectionViewSection = self._dataSource.sections[indexPath.section]
        section.didEndDisplaying(cell: cell, at: indexPath)
    }
}
