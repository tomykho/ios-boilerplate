//
//  BaseCollectionNode.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/10/17.
//
//

import AsyncDisplayKit

class CollectionNode: ASCollectionNode {
    
    convenience override init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        self.init(collectionViewLayout: flowLayout)
    }
    
}
