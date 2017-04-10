//
//  TableStateLayout.swift
//  Application
//
//  Created by Tomy Kho on 4/10/17.
//
//

import AsyncDisplayKit

class TableStateLayout: StateLayout {
    
    let tableNode = ASTableNode()
    let activityIndicator = ActivityIndicator()
    
    override var state: State {
        didSet {
            switch state {
            case .loading:
                activityIndicator.isHidden = false
                tableNode.isHidden = true
                break
            case .loaded:
                activityIndicator.isHidden = true
                tableNode.isHidden = false
                break
            default:
                break
            }
        }
    }
    
    override init() {
        super.init()
        state = .loading
    }
    
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASAbsoluteLayoutSpec(children: [activityIndicator, tableNode])
    }
    
}
