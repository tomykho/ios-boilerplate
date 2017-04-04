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
    var currentNode: ASDisplayNode! {
        willSet {
            if let currentNode = currentNode {
                currentNode.frame = CGRect.zero
                newValue.frame = self.view.bounds
            }
        }
    }
    
    func createView() -> L {
        return L()
    }
    
    override func loadView() {
        super.loadView()
        layoutNode = self.createView()
        currentNode = layoutNode
        self.view.backgroundColor = .white
        self.view.addSubnode(currentNode)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.currentNode.frame = self.view.bounds
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
