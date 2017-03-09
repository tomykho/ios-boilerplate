//
//  BaseCollectionAdapter.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/9/17.
//
//

import AsyncDisplayKit

class BaseCollectionAdapter<M>: NSObject, ASCollectionDataSource, ASCollectionDelegate {
    
    let collectionNode: ASCollectionNode!
    var items: [M] = [] {
        didSet {
            collectionNode.reloadData()
        }
    }
    var didSelectItem: ((Int, M) -> Void)?
    
    required init(collectionNode: ASCollectionNode) {
        self.collectionNode = collectionNode
        super.init()
        collectionNode.delegate = self
        collectionNode.dataSource = self
    }
    
    func cellForRowAt(index: Int) -> BaseCell<M> {
        fatalError("cellForRowAt(index:) has not been implemented")
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            return self.cellForRowAt(index: indexPath.item)
        }
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
        if let didSelectItem = self.didSelectItem {
            didSelectItem(indexPath.item, self.items[indexPath.item])
        }
    }
    
}
