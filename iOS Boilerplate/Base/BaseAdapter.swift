//
//  BaseTableViewAdapter.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/8/17.
//
//

import AsyncDisplayKit

class BaseAdapter<M>: NSObject {
    var items: [M] = [] {
        didSet {
        }
    }
    var didSelectItem: ((Int, M) -> Void)?
}

class BaseTableAdapter<M>: BaseAdapter<M>, ASTableDataSource, ASTableDelegate {
    
    let tableNode: ASTableNode!
    override var items: [M] {
        didSet {
            tableNode.reloadData()
        }
    }
    
    required init(tableNode: ASTableNode) {
        self.tableNode = tableNode
        super.init()
        tableNode.delegate = self
        tableNode.dataSource = self
    }
    
    func cellForRowAt(index: Int) -> BaseCell<M> {
        fatalError("cellForRowAt(index:) has not been implemented")
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        tableNode.deselectRow(at: indexPath, animated: true)
        if let didSelectItem = self.didSelectItem {
            didSelectItem(indexPath.row, self.items[indexPath.row])
        }
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        return self.cellForRowAt(index: indexPath.row)
    }
    
}

class BaseCollectionAdapter<M>: BaseAdapter<M>, ASCollectionDataSource, ASCollectionDelegate {
    
    let collectionNode: ASCollectionNode!
    override var items: [M] {
        didSet {
            collectionNode.reloadData()
        }
    }
    
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
