//
//  BaseCollectionController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/9/17.
//
//

import AsyncDisplayKit

class BaseCollectionController: BaseController<ASCollectionNode> {
    
    let flowLayout = UICollectionViewFlowLayout()
    
    override func loadView() {
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        layout = ASCollectionNode(collectionViewLayout: flowLayout)
    }
    
}
