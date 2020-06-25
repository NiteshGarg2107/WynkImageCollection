//
//  NSObject.swift
import Foundation
extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
    
    /**
     This function is used for adding multiple observers on view.
     - Author:  Nitesh Garg
     - Returns: Void
     - Parameters:
     - input: array of tuple which contain the observer parameter
     */
    func addViewObservers(input: [(selector: Selector, aName: NSNotification.Name?, anObject: Any?)]) {
        for data in input {
            addViewObserver(selector: data.selector, name: data.aName, object: data.anObject)
        }
    }
    
    /**
     This method is used for adding the observer on the view.
     - Author:  Nitesh Garg
     - Returns: Void
     - Parameters:
     - selector: set the target for the obser
     - aName: give the name for the observer on which is called.
     -anObject: paas object which you want to pass with the observer.
     */
    func addViewObserver( selector aSelector: Selector, name aName: NSNotification.Name?, object anObject: Any?) {
        NotificationCenter.default.addObserver(self, selector: aSelector, name: aName, object: anObject)
    }
    
    /**
     This function is used for remove multiple observers on view.
     - Author:  Nitesh Garg
     - Returns: Void
     - Parameters:
     - input: array of tuple which contain the observer parameter
     */
    func removeObservers(input: [(selector: Selector, aName: NSNotification.Name?, anObject: Any?)]) {
        for data in input {
            removeObserver(selector: data.selector, aName: data.aName, anObject: data.anObject)
        }
    }
    
    /**
     This method is used for remove the observer on the view.
     - Author:  Nitesh Garg
     - Returns: Void
     - Parameters:
     - aName: give the name for the observer on which is called.
     -anObject: paas object which you want to pass with the observer.
     */
    func removeObserver(selector: Selector, aName: NSNotification.Name?, anObject: Any?) {
        NotificationCenter.default.removeObserver(self, name: aName, object: anObject)
    }
}
