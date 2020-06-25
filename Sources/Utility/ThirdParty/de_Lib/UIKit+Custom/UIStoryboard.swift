//
//  UIStoryboard.swift

import UIKit

extension UIStoryboard {

    class var main: UIStoryboard {
        let storyboardName: String = Bundle.main.object(forInfoDictionaryKey: "UIMainStoryboardFile") as! String
        return UIStoryboard(name: storyboardName, bundle: nil)
    }
    class func mainStoryboard(storyboardName: String?) -> UIStoryboard {
        guard  let storyboard = storyboardName else {
            return UIStoryboard.main
        }
        return UIStoryboard(name: storyboard, bundle: nil)
    }
}
