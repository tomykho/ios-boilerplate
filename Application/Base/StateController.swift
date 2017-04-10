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

class StateController<L: StateLayout>: BaseController<L> {
    
    var state: State {
        get {
            return self.layoutNode.state
        }
        set {
            self.layoutNode.state = newValue
        }
    }

}

class StateListController<L: StateLayout, T: JSONDecodable>: StateController<L> {
    
    var subscription: Disposable?
    var request: Observable<[T]>? {
        get {
            return nil
        }
    }
    private var adapter: BaseAdapter<T>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.adapter = self.loadAdapter()
        if let adapter = self.adapter {
            adapter.didSelectItem = { index, item in
                self.didSelectItemAt(index, item: item)
            }
        }
        refresh()
    }
    
    func refresh() {
        if let request = request, let adapter = adapter {
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

class StateLayout: BaseLayout {
    
    var state: State = .loading
    
    override init() {
        super.init()
    }
    
}
