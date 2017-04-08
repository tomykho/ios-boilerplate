//
//  ASElementStyle.swift
//  Application
//
//  Created by Tomy Kho on 4/9/17.
//
//

import AsyncDisplayKit

extension ASLayoutElementStyle {
    
    var flex: CGFloat {
        get {
            return flexGrow
        }
        set {
            flexGrow = 1
            flexShrink = 1
            flexBasis = ASDimensionMake(0)
        }
    }
    
}
