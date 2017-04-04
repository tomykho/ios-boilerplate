//
//  Button.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/9/17.
//
//

import AsyncDisplayKit

class Button: ASButtonNode {
    
    var textColor: UIColor?
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                alpha = 0.2
            } else {
                alpha = 1
            }
        }
    }
    
    override init() {
        super.init()
        textColor = .white
        backgroundColor = R.color.application.red()
        contentEdgeInsets = UIEdgeInsetsMake(8, 8, 8, 8)
    }
    
    func setTitle(_ title: String, for state: UIControlState) {
        setTitle(title, with: nil, with: textColor, for: state)
    }
    
}

