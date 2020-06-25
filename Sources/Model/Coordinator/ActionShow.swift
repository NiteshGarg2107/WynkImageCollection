import UIKit
/**
 It is a **CoordinatorBase Class** used for navigation to another controller.
 - Author:  Nitesh Garg
 - Date: June 25, 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */
protocol NavigationProtocol {
    /**
     It show the control on which we have to navigate.
     - Author:  Nitesh Garg
     - Returns: Void
     */
    func showControl()
    
    /**
     Must override in child controls to pass control to show.
     - Author:  Nitesh Garg
     - Returns: Void
     */
    var control: AbstractControl! {get}
    
    /**
     Navigate to other control.
     - Author:Nitesh Garg
     - Remark: This function is used for navigate to other Control.
     - Parameter newControl: Pass the control on which you want to navigate.
     - Returns: Void.
     */
    func navigate(_ newControl: AbstractControl) -> Void
    
    /**
     Navigate to root control.
     - Author:Nitesh Garg
     - Remark: This function is used for navigate to other Control.
     - Parameter newControl: Pass the control on which you want to navigate.
     - Returns: Void.
     */
    static func popToRootViewController()
    
    /**
     Pop to control.
     - Author:Nitesh Garg
     - Remark: This function is used for navigate to other Control.
     - Parameter newControl: Pass the control on which you want to navigate.
     - Returns: Void.
     */
    static func popToViewController(control: AbstractControl.Type) 
}

extension NavigationProtocol {
    /**
     Navigate to other control.
     - Author:Nitesh Garg
     - Remark: This function is used for navigate to other Control.
     - Parameter newControl: Pass the control on which you want to navigate.
     - Returns: Void.
     */
    func navigate(_ newControl: AbstractControl) -> Void {
        if UIApplication.visibleViewController.className != newControl.className {
            (UIApplication.visibleNavigationController).pushViewController(newControl, animated: true)
        }
    }
    
    /**
     pop to root control.
     - Author:Nitesh Garg
     - Remark: This function is used for navigate to other Control.
     - Parameter newControl: Pass the control on which you want to navigate.
     - Returns: Void.
     */
    static func popToRootViewController() {
        (UIApplication.visibleNavigationController).popToRootViewController(animated: true)
    }
    
    /**
     Pop to control.
     - Author:Nitesh Garg
     - Remark: This function is used for navigate to other Control.
     - Parameter newControl: Pass the control on which you want to navigate.
     - Returns: Void.
     */
    static func popToViewController(control: AbstractControl.Type) {
        _ = (UIApplication.visibleNavigationController).viewControllers.map {
            if $0.isKind(of: control) {
                 (UIApplication.visibleNavigationController).popToViewController($0, animated: true)
            }
        }
    }
}

/**
 It is a coordinator class used for navigation to HISMenuControl.
 - Author:  Nitesh Garg
 - Date: June 25, 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */
struct Navigator<T: AbstractControl>: NavigationProtocol {
    
    // Navigation to Control
    func showControl() {
        navigate(control)
    }
    
    ///Override init for user
    init() {
        showControl()
    }
    
    ///Return AbstractControl on which you want to navigate.
    var control: AbstractControl! {
        return T.control
    }
}

/**
 It is a coordinator class used for navigation to HISVideoPlayerControl.
 - Author:  Nitesh Garg
 - Date: June 29,2018
 - Copyright: © 2018 HaloInnovativeSolutions. All rights reserved.
 */

struct NavigatorWithObject<T: AbstractControl>: NavigationProtocol {
    let modelObject: AnyObject?
    ///Override init for user
    init(modelObject: AnyObject) {
        self.modelObject = modelObject
        showControl()
    }
    
    // Navigate to control
    func showControl() {
        navigate(control)
    }
    
    ///Return AbstractControl on which you want to navigate.
    var control: AbstractControl! {
        return T.controlWithModel(modelObject)
    }
}
