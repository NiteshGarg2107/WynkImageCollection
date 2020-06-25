import UIKit

public extension NSLayoutConstraint {
    
    func changeMultiplier(multiplier: CGFloat) -> NSLayoutConstraint {
        let newConstraint = NSLayoutConstraint(
            item: firstItem as Any, 
            attribute: firstAttribute, 
            relatedBy: relation, 
            toItem: secondItem, 
            attribute: secondAttribute, 
            multiplier: multiplier, 
            constant: constant)
        newConstraint.priority = priority
        
        NSLayoutConstraint.deactivate([self])
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
    
}
