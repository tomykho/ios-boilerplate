//
//  MainController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/9/17.
//
//

import AsyncDisplayKit

class MainController: BaseController<MainLayout> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main"
        
        layout.addPostButton.addTarget(self, action: #selector(addPost), forControlEvents: .touchUpInside)
        layout.albumsButton.addTarget(self, action: #selector(showAlbums), forControlEvents: .touchUpInside)
    }
    
    func addPost() {
        let controller = AddPostController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showAlbums() {
        let controller = AlbumController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
