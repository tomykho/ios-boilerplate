//
//  BaseController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/9/17.
//
//

import AsyncDisplayKit

class BaseController<L: ASDisplayNode>: UIViewController {
    
    var layout: L! {
        didSet {
            self.view = layout.view
        }
    }
    
    override func loadView() {
        layout = L()
    }
    
}
