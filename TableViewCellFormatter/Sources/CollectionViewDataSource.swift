//
//  CollectionViewDataSource.swift
//  rip-harambe-workout-tracker
//
//  Created by Chandler De Angelis on 8/16/17.
//  Copyright © 2017 Chandler De Angelis. All rights reserved.
//

import Foundation
import UIKit

open class CollectionViewDataSource: NSObject {
    
    open var sections: [CollectionViewSection]
    
    public var collectionView: UICollectionView?
    
    public init(sections: [CollectionViewSection]) {
        self.sections = sections
        super.init()
    }
    
    open func registerCells(with collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
}
// MARK: - UICollectionViewDataSource
extension CollectionViewDataSource: UICollectionViewDataSource {
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.sections.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let currentSection: CollectionViewSection = self.sections[section]
        return currentSection.rowCount
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let currentSection: CollectionViewSection = self.sections[indexPath.section]
        return currentSection.cell(for: indexPath, in: collectionView)
    }
}



