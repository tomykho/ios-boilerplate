//
//  ViewController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/2/17.
//
//

import UIKit
import AsyncDisplayKit

class PhotoController: ASViewController<ASCollectionNode> {
    let collectionNode: ASCollectionNode!
    var photos = [Photo]()
    var album: Album!
    
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        collectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
        super.init(node: collectionNode)
        self.title = "Photos"
        collectionNode.delegate = self
        collectionNode.dataSource = self
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        API.request(.photos(album.id)) { (photos: [Photo]) in
            self.photos = photos
            self.collectionNode.reloadData()
        }
    }
    
}

extension PhotoController: ASCollectionDataSource {
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return self.photos.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return  {
            return PhotoCell(photo: self.photos[indexPath.item])
        }
    }
}

extension PhotoController: ASCollectionDelegate {
    func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
    }
}

