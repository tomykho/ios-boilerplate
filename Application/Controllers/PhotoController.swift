//
//  ViewController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/2/17.
//
//

import AsyncDisplayKit
import RxSwift

class PhotoController: StateListController<CollectionStateLayout, Photo> {
    
    override var request: Observable<[Photo]>? {
        get {
            return API.Albums.photos(album.id)
        }
    }
    var adapter: PhotoAdapter!
    var album: Album!
    
    override func loadAdapter() -> BaseAdapter<Photo> {
        adapter = PhotoAdapter(collectionNode: self.layoutNode.collectionNode)
        return adapter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photos"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if let navigationBarMaxY = navigationController?.navigationBar.frame.maxY {
            let insets = UIEdgeInsets(top: navigationBarMaxY, left: 0, bottom: 0, right: 0)
            self.layoutNode.collectionNode.view.contentInset = insets
            self.layoutNode.collectionNode.view.scrollIndicatorInsets = insets
        }
    }
    
}
