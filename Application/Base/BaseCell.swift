//
//  BaseCell.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/9/17.
//
//

import AsyncDisplayKit

class BaseCell<T>: ASCellNode {
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                alpha = 0.2
            } else {
                alpha = 1
            }
        }
    }
    
    required init(item: T) {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
    
}
