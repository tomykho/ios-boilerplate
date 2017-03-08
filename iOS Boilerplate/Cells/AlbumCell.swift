//
//  PhotoCell.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/8/17.
//
//


import AsyncDisplayKit

class AlbumCell: ASCellNode {
    
    private let titleNode = ASTextNode()
    
    init(album: Album) {
        super.init()
        titleNode.attributedText = NSAttributedString(string: album.title)
        
        addSubnode(titleNode)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        let verticalStackSpec = ASStackLayoutSpec.vertical()
        verticalStackSpec.alignItems = .start
        verticalStackSpec.spacing = 5.0
        verticalStackSpec.children = [titleNode]
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), child: verticalStackSpec)
    }
    
}
