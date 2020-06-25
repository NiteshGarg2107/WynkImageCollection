//
//  UIRefreshControl.swift
import UIKit

extension UIRefreshControl {

    func endRefreshingIfNeeded() {
        if isRefreshing {
            endRefreshing()
        }
    }
}
