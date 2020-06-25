import UIKit
/**
 This extension is define the extended functionality of **UIBarButtonItems**.
 - Author:  Nitesh Garg
 - Date: Sep 11, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */

extension UIBarButtonItem {
    /**
     This function create the button items of type of **UIBarButtonItem**.
     - Author:  Nitesh Garg
     - Returns: Void
     - Remark: variadic parameter define the type.
     - Parameter input: define the variadic parameter for creating barButton items.
     */
    class func barButtonItems(input: [(type: AnyObject?, style: UIBarButtonItem.Style, target: Any?, action: Selector?)]) -> [UIBarButtonItem] {
        var barButtonItems = [UIBarButtonItem]()
        for item in input {
            if item.type is UIImage {
                barButtonItems.append(UIBarButtonItem(image: item.type as? UIImage, style: item.style, target: item.target, action: item.action))
            } else if item.type is String  {
                barButtonItems.append(UIBarButtonItem(title: item.type as? String, style: item.style, target: item.target, action: item.action))
            } else {
                barButtonItems.append(UIBarButtonItem(barButtonSystemItem: item.type as! UIBarButtonItem.SystemItem, target: nil, action: nil))
            }
        }
        return barButtonItems
    }
}
