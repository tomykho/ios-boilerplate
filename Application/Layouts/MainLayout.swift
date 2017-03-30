//
//  HelloWordLayout.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/2/17.
//
//

import AsyncDisplayKit

class MainLayout: BaseLayout {
    
    let addPostButton = Button()
    let albumsButton = Button()
    
    override init() {
        super.init()
        addPostButton.setTitle("Add Post", for: .normal)
        albumsButton.setTitle("Albums", for: .normal)
    }
    
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 10,
            justifyContent: .center,
            alignItems: .center,
            children: [
                addPostButton,
                albumsButton
            ]
        )
    }
}
