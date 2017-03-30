//
//  AlbumAdapter.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/9/17.
//
//

import AsyncDisplayKit

class AlbumAdapter: BaseTableAdapter<Album> {
    
    override func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        return AlbumCell(item: self.items[indexPath.row])
    }
    
    class AlbumCell: BaseCell<Album> {
        
        private let titleNode = ASTextNode()
        
        required init(item: Album) {
            super.init(item: item)
            titleNode.attributedText = NSAttributedString(string: item.title)
        }
        
        override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
            let verticalStackSpec = ASStackLayoutSpec.vertical()
            verticalStackSpec.alignItems = .start
            verticalStackSpec.spacing = 5.0
            verticalStackSpec.children = [titleNode]
            return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), child: verticalStackSpec)
        }
        
    }
    
}

