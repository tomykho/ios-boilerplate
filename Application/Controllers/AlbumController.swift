//
//  ViewController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/2/17.
//
//

import AsyncDisplayKit
import RxSwift

class AlbumController: StateListController<TableStateLayout, Album> {
    
    override var request: Observable<[Album]>? {
        get {
            return API.Albums.find()
        }
    }
    var adapter: AlbumAdapter!
    
    override func loadAdapter() -> BaseAdapter<Album> {
        adapter = AlbumAdapter(tableNode: self.layoutNode.tableNode)
        return adapter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Albums"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if let navigationBarMaxY = navigationController?.navigationBar.frame.maxY {
            let insets = UIEdgeInsets(top: navigationBarMaxY, left: 0, bottom: 0, right: 0)
            self.layoutNode.tableNode.view.contentInset = insets
            self.layoutNode.tableNode.view.scrollIndicatorInsets = insets
        }
    }
    
    override func didSelectItemAt(_ index: Int, item: Album) {
        let controller = PhotoController()
        controller.album = item
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
