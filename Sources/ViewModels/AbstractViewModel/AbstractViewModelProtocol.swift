import UIKit
/**
 This are the Abstract protocol which we used for pass the response data from service.
 - Author:  Nitesh Garg
 - Date: June 22, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
//sourcery: AutoMockable
@objc protocol AbstractViewModelProtocol: NSObjectProtocol {
    /**
     This function is used for  passing the service data to the desired viewcontroller.
     - Author:  Nitesh Garg
     - Returns: Void
     - Parameter response: response data which we fetch from the service.
     */
    @objc optional func getServiceData(_ response: AnyObject) -> Void
    @objc optional func showErrorMessage(_ error: Error) -> Void
}
