//
//  ViewController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/2/17.
//
//

import AsyncDisplayKit
import RxSwift

class AlbumController: StateListController<ASTableNode, Album> {
    
    override var request: Observable<[Album]>? {
        get {
            return API.request(.albums)
        }
    }
    var adapter: AlbumAdapter!
    
    override func loadAdapter() -> BaseAdapter<Album> {
        adapter = AlbumAdapter(tableNode: self.layoutNode)
        return adapter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Albums"
    }
    
    override func didSelectItemAt(_ index: Int, item: Album) {
        let controller = PhotoController()
        controller.album = item
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
