//
//  Float.swift

import UIKit

extension Float {

    func price(_ symbol: String) -> String {
        return NSString(format: "%@%.2f", symbol, self) as String
    }
    
    var string: String {
        return NSString(format: "%.2f", self) as String
    }
    
}

extension Int {
    
    var string: String {
        return NSString(format: "%i", self) as String
    }
    
    //Non-optional bool
    public var boolValue: Bool {
        if ( ["true", "y", "t", "1", "4"].contains(String(describing: self))) {
            return true
        } else {
            return false
        }
        
    }
}
