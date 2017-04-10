//
//  BaseController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/9/17.
//
//

import AsyncDisplayKit

class BaseController<L>: UIViewController where L: ASDisplayNode {
    
    var layoutNode: L!
    
    func createView() -> L {
        return L()
    }
    
    override func loadView() {
        layoutNode = self.createView()
        self.view = layoutNode.view
        if let delegate = UIApplication.shared.delegate {
            self.view.backgroundColor = delegate.window??.backgroundColor
        } else {
            self.view.backgroundColor = .white
        }
    }
    
    override func didMove(toParentViewController parent: UIViewController?) {
        super.didMove(toParentViewController: parent)
        if parent == nil {
            self.didBack()
        }
    }
    
    func didBack() {
        
    }
    
}
