import UIKit
/**
 This extension define the extended functionality of **UIToolbar**.
 - Author:  Nitesh Garg
 - Date: Sep 9, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
extension UIToolbar {
    /**
     This function define the tool bar with barButton items.
     - Author:  Nitesh Garg
     - Returns: UIToolbar
     - Remark:
     - Parameters:
     - toolBarInputs: This inputs define the for set the parameter of tools.
     - barButtonInputs: This parameter define the inputs for the barbutton items.
     */
    class func toolBarWithItems(toolBarInputs: (style: UIBarStyle, color: UIColor), barButtonInputs: [(type: AnyObject?, style: UIBarButtonItem.Style, target: Any?, action: Selector?)]) -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.barStyle = toolBarInputs.style
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = .white
        toolBar.barTintColor = #colorLiteral(red: 0.1333333333, green: 0.4666666667, blue: 0.6745098039, alpha: 1)
        toolBar.sizeToFit()
    toolBar.setItems(UIBarButtonItem.barButtonItems(input: barButtonInputs), animated: false)
    toolBar.isUserInteractionEnabled = true
    return toolBar
    }
}
