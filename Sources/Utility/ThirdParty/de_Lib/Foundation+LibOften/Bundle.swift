import UIKit
import Foundation

/**
 This extension define the extended functionality of the bundle.
 - Author:  Nitesh Garg
 - Date: March 14, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
extension Bundle {
  var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}
