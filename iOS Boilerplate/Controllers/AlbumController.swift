//
//  ViewController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/2/17.
//
//

import AsyncDisplayKit

class AlbumController: BaseController<ASTableNode> {
    
    var adapter: AlbumAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Albums"
        adapter = AlbumAdapter(tableNode: self.layout)
        API.request(.albums) { (items: [Album]) in
            self.adapter.items = items
        }
        self.adapter.didSelectItem = { index, album in
            let controller = PhotoController()
            controller.album = album
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}
