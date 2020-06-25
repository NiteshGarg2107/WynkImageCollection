//
//  NSAttributedString.swift
import UIKit

extension NSAttributedString {

    class func attributeTitle(title firstString: String, last lastString: String) -> NSAttributedString {
        let string: String = firstString + (lastString)
        let attString = NSMutableAttributedString(string: string)
        attString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], range: (string as NSString).range(of: firstString))
//        attString.addAttributes([NSForegroundColorAttributeName: themeColor], range: (string as NSString).range(of: lastString))
        return attString
    }
}
