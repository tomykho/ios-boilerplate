//
//  StateController.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/9/17.
//
//

import AsyncDisplayKit
import RxSwift
import TRON

enum State {
    case loading
    case loaded
    case empty
    case error
}

class StateController<L: ASDisplayNode>: BaseController<L> {
    
    lazy var loadingNode: ASDisplayNode = {
        return ASDisplayNode(viewBlock: { () -> UIView in
            let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
            activityIndicator.color = .gray
            activityIndicator.startAnimating()
            return activityIndicator;
        })
    }()
    var state: State = .loading {
        didSet {
            switch state {
            case .loading:
                break
            case .loaded:
                self.currentNode = layoutNode
                break
            case .empty:
                break
            case .error:
                break
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        self.view.addSubnode(loadingNode)
        self.currentNode = loadingNode
    }

}

class StateListController<L: ASDisplayNode, T: JSONDecodable>: StateController<L> {
    
    var subscription: Disposable?
    var request: Observable<[T]>? {
        get {
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let request = request, let adapter = self.loadAdapter() {
            self.subscription = request.subscribe { event in
                switch event {
                case let .next(items):
                    self.state = .loaded
                    adapter.items = items
                    break
                case let .error(error):
                    print(error)
                    break
                case .completed:
                    break
                }
            }
            adapter.didSelectItem = { index, item in
                self.didSelectItemAt(index, item: item)
            }
        }
    }
    
    func loadAdapter() -> BaseAdapter<T>? {
        return nil
    }
    
    func didSelectItemAt(_ index: Int, item: T) {
        
    }
    
    override func didBack() {
        super.didBack()
        subscription?.dispose()
    }
    
}
