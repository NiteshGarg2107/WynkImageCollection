//
//  ListBackgroundView.swift
//  Rewire
//
//  Created by Lakhwinder Singh on 17/11/16.
//
//

import UIKit

class ListBackgroundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
    }
    
    func initViews() {
        backgroundColor = UIColor.clear
        addSubviews([messageLabel, searchView])
        searchView.addSubviews([searchLabel, indicator])
    }
    
    // MARK: Getters and Setters
    
    var messageText: String {
        get {
            return messageLabel.text!
        }
        set {
            messageLabel.text = newValue
        }
    }
    
    var searchText: String? {
        get {
            return searchLabel.text!
        }
        set {
            let isValue = newValue != nil && newValue?.length != 0
            searchView.isHidden = !isValue
            messageLabel.isHidden = isValue
            if isValue {
                searchLabel.text = String(format: "Searching for \"%@\"", newValue!)
                indicator.startAnimating()
            } else {
                indicator.stopAnimating()
            }
        }
    }

    var _indicator: UIActivityIndicatorView!
    var indicator: UIActivityIndicatorView {
        get {
            if (_indicator == nil) {
                _indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
                _indicator.color = .white
                _indicator.hidesWhenStopped = true
            }
            return _indicator
        }
        set {
            _indicator = newValue
        }
    }
    
    var _searchView: UIView!
    var searchView: UIView {
        get {
            if(_searchView == nil) {
                _searchView = UIView()
                _searchView.backgroundColor = .clear
            }
            return _searchView
        }
        set {
            _searchView = newValue
        }
    }
    
    var _searchLabel: UILabel?
    var searchLabel: UILabel {
        get {
            if (_searchLabel == nil) {
                _searchLabel = UILabel()
                _searchLabel?.textColor = UIColor.lightGray
                //_searchLabel?.font = UIFont(name: sys, size: 20)
            }
            return _searchLabel!
        }
        set {
            _searchLabel = newValue
        }
    }
    
    var _messageLabel: UILabel?
    var messageLabel: UILabel {
        get {
            if (_messageLabel == nil) {
                _messageLabel = UILabel()
                _messageLabel?.textColor = UIColor.lightGray
                //_messageLabel?.font = UIFont(name: semiBoldFontname, size: 25)
                _messageLabel?.textAlignment = .center
            }
            return _messageLabel!
        }
        set {
            _messageLabel = newValue
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let subViews = ["message": messageLabel, "searchView": searchView]
        addVisualConstraints(["V:|[searchView(50)]-[message]|", "H:|[message]|", "H:|[searchView]|"], subviews: subViews)
        searchView.addVisualConstraints(["H:|-20-[indicator]-20-[searchLabel(>=5)]|"], subviews:  ["indicator": indicator, "searchLabel": searchLabel])
        addConstraintSameCenterY(searchView, view2: searchLabel)
        addConstraintSameCenterY(searchView, view2: indicator)
    }
    
}


