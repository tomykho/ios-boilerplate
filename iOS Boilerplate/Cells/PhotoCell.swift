//
//  PhotoCell.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/8/17.
//
//


import AsyncDisplayKit

class PhotoCell: ASCellNode {
    
    private let imageNode = ASNetworkImageNode()
    
    init(photo: Photo) {
        super.init()
        imageNode.shouldRenderProgressImages = true
        imageNode.url = URL(string: photo.url)
        
        self.addSubnode(imageNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let size = (constrainedSize.max.width / 4) - 1
        imageNode.style.preferredSize = CGSize(width: size, height: size)
        
        let verticalStackSpec = ASStackLayoutSpec.vertical()
        verticalStackSpec.alignItems = .start
        verticalStackSpec.children = [imageNode]
        return verticalStackSpec
    }
    
}
