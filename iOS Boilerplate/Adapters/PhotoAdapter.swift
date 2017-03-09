//
//  PhotoAdapter.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/9/17.
//
//

import AsyncDisplayKit

class PhotoAdapter: BaseCollectionAdapter<Photo> {
    
    override func cellForRowAt(index: Int) -> BaseCell<Photo> {
        return PhotoCell(item: self.items[index])
    }
    
    class PhotoCell: BaseCell<Photo> {
        
        private let imageNode = ASNetworkImageNode()
        
        required init(item: Photo) {
            super.init(item: item)
            imageNode.shouldRenderProgressImages = true
            imageNode.url = URL(string: item.url)
            
            let numberOfColumns: CGFloat = 4
            let size = (UIScreen.main.nativeBounds.width / UIScreen.main.scale) / numberOfColumns
            imageNode.style.preferredSize = CGSize(width: size, height: size)
        }
        
        override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
            return ASWrapperLayoutSpec(layoutElement: imageNode)
        }
        
    }

    
}

