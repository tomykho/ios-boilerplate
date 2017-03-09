//
//  ViewController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/2/17.
//
//

import AsyncDisplayKit

class PhotoController: BaseCollectionController {
    
    var adapter: PhotoAdapter!
    var album: Album!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photos"
        adapter = PhotoAdapter(collectionNode: self.layout)
        API.request(.photos(album.id)) { (items: [Photo]) in
            self.adapter.items = items
        }
        self.adapter.didSelectItem = { index, photo in
            print(photo.id)
        }
    }
    
}
