//
//  ViewController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/2/17.
//
//

import AsyncDisplayKit
import RxSwift

class PhotoController: StateListController<ASCollectionNode, Photo> {
    
    override var request: Observable<[Photo]>? {
        get {
            return API.Albums.photos(album.id)
        }
    }
    var adapter: PhotoAdapter!
    var album: Album!
    
    override func createView() -> ASCollectionNode {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.minimumLineSpacing = 0
        return ASCollectionNode(collectionViewLayout: flowLayout)
    }
    
    override func loadAdapter() -> BaseAdapter<Photo> {
        adapter = PhotoAdapter(collectionNode: self.layoutNode)
        return adapter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photos"
    }
    
}
