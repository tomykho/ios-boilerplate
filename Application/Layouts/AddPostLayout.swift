//
//  PostLayout.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/9/17.
//
//

import AsyncDisplayKit

class AddPostLayout: BaseLayout {
    
    var postsButton: ASButtonNode!
    
    override init() {
        super.init()
        postsButton = ASButtonNode()
        postsButton.borderColor = UIColor.black.cgColor
        postsButton.borderWidth = 1
        postsButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        postsButton.setTitle("Add", with: nil, with: .red, for: .normal)
    }
    
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASStackLayoutSpec(
            direction: .vertical,
            spacing: 10,
            justifyContent: .center,
            alignItems: .center,
            children: [
                postsButton
            ]
        )
    }
}

