//
//  BaseTableViewAdapter.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/8/17.
//
//

import UIKit

class BaseTableViewAdapter<T>: NSObject, UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView!
    var items: [T] = [] {
        didSet { tableView.reloadData() }
    }
    var itemDidSelectHandler: ((Int, T) -> Void)?
    var itemViewDidClickHandler: ((UIView, Int, T) -> Void)?
    
    init(tableView: UITableView) {
        super.init()
        self.items = []
        self.tableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func itemAtIndexPath(_ indexPath: IndexPath) -> T {
        return items[indexPath.item]
    }
    
    func itemSelected(sender: UIButton) {
        if let handler = itemDidSelectHandler {
            let cell = sender.superview!.superview as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            handler(sender.tag, itemAtIndexPath(indexPath!))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("cellForItemAtIndexPath has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let handler = itemDidSelectHandler {
            let index = indexPath.row
            handler(index, itemAtIndexPath(indexPath))
        }
    }
    
    func onItemSelected(index: Int, item: T) {
        if let handler = itemDidSelectHandler {
            handler(index, item)
        }
    }
    
    func onItemClicked(sender: UIButton) {
        if let handler = itemViewDidClickHandler {
            let index = sender.tag
            handler(sender, index, items[index])
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension UITableViewCell {
    override open var backgroundColor: UIColor? {
        get {
            return .clear
        }
        set {
        }
    }
}
