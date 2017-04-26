//
//  CollectionStateLayout.swift
//  Application
//
//  Created by Tomy Kho on 4/10/17.
//
//

import AsyncDisplayKit

class CollectionStateLayout: StateLayout {
    
    let collectionNode: ASCollectionNode
    let activityIndicator = ActivityIndicator()
    
    override var state: State {
        didSet {
            switch state {
            case .loading:
                activityIndicator.isHidden = false
                collectionNode.isHidden = true
                break
            case .loaded:
                activityIndicator.isHidden = true
                collectionNode.isHidden = false
                break
            default:
                break
            }
        }
    }
    
    override convenience init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        self.init(collectionViewLayout: flowLayout)
    }
    
    init(collectionViewLayout: UICollectionViewLayout) {
        collectionNode = ASCollectionNode(collectionViewLayout: collectionViewLayout)
        super.init()
        state = .loading
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASAbsoluteLayoutSpec(children: [activityIndicator, collectionNode])
    }
    
}
