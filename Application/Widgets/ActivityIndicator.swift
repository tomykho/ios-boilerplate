//
//  ActivityIndicator.swift
//  Application
//
//  Created by Tomy Kho on 4/10/17.
//
//

import AsyncDisplayKit

class ActivityIndicator: ASDisplayNode {
    
    var indicatorView: UIActivityIndicatorView
    
    override init() {
        indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        indicatorView.color = .gray
        indicatorView.startAnimating()
        super.init()
        setViewBlock { () -> UIView in
            return self.indicatorView
        }
    }
    
}

