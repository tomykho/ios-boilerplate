//
//  BaseTableViewAdapter.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/8/17.
//
//

import AsyncDisplayKit

class BaseTableAdapter<M>: NSObject, ASTableDataSource, ASTableDelegate {
    
    let tableNode: ASTableNode!
    var items: [M] = [] {
        didSet { tableNode.reloadData() }
    }
    var didSelectItem: ((Int, M) -> Void)?
    
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
