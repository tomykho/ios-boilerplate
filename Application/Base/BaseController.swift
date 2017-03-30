//
//  BaseController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/9/17.
//
//

import AsyncDisplayKit

class BaseController<L: ASDisplayNode>: UIViewController {
    
    var layoutNode: L!
    var currentNode: ASDisplayNode! {
        willSet {
            currentNode.frame = CGRect.zero
            newValue.frame = self.view.bounds
        }
    }
    
    init() {
        layoutNode = L()
        currentNode = layoutNode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
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
