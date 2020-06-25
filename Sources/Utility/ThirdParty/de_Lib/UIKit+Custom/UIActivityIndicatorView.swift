//
//  UIActivityIndicatorView.swift
import UIKit

extension UIActivityIndicatorView {

    var setAnimating: Bool {
        get {
            return isAnimating
        }
        set {
            if newValue {
                self.startAnimating()
            } else {
                self.stopAnimating()
            }
        }
    }
    
}
