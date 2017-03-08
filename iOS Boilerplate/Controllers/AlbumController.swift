//
//  ViewController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/2/17.
//
//

import UIKit
import AsyncDisplayKit

class AlbumController: ASViewController<ASTableNode> {
    let tableNode = ASTableNode()
    var albums = [Album]()
    
    init() {
        super.init(node: tableNode)
        self.title = "Albums"
        tableNode.delegate = self
        tableNode.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        API.request(.albums) { (albums: [Album]) in
            self.albums = albums
            self.tableNode.reloadData()
        }
    }
    
}

extension AlbumController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return self.albums.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        return AlbumCell(album: self.albums[indexPath.row])
    }
}

extension AlbumController: ASTableDelegate {
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        tableNode.deselectRow(at: indexPath, animated: true)
        
        let photoController = PhotoController()
        photoController.album = self.albums[indexPath.row]
        self.navigationController?.pushViewController(photoController, animated: true)
    }
}

