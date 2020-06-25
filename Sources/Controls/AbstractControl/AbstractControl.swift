//
//  AbstractControl.swift

import UIKit
/**
 This enum define the alert or navigation bar button .
 - Author:  Nitesh Garg
 - Date:  June 25 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */
enum AlertButton {
    static let ok = "OK"
    static let done = "Done"
    static let cancel = "Cancel"
    static let save = "Save"
    static let send = "Send"
}

/**
This define the abstract class of the Which is the base class of the all classes.
- Author:  Nitesh Garg
- Date:  June  20, 2020
- Copyright: © 2020 Wynk. All rights reserved.
*/
class AbstractControl: UIViewController, ListControlDelegate {
    
    // MARK: - This instance is used for CollectionList
    @IBOutlet var listContainer: UIView!

    // MARK: - This instance is used for getting the data from one control to anothe
    var model: AnyObject?
    
    /**
        This define the instance of Abstract control
     - Author:  Nitesh Garg
     - Returns: AbstractControl
     - Parameters:
     */
    class var control: AbstractControl {
        return UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: self)) as! AbstractControl
    }
    
    /**
    This function is used for getting the data form one control to anothre through navigation.
    - Author:  Nitesh Garg
    - Returns: AbstractControl
    - Parameters: - model:
    */
    class func controlWithModel(_ model: AnyObject?) -> AbstractControl {
        let control = self.control
        control.model = model
        return control
    }
    
    //MARK:- View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        initListControl()
    }
    
    /**
       This function is used for setup the listcontrol View..
       - Author:  Nitesh Garg
       - Returns: Void
       - Parameters:
       */
    func initListControl() {
        if listContainer != nil {
            if collectionControl != nil {
                customAddChildViewController(collectionControl, toSubview: listContainer)
            }
        }
    }

    /**
       This instance define the collection list
       - Author:  Nitesh Garg
       - Returns: AbstractCollectionListControl.Type!
       - Parameters:
       */

    var collectionClass: AbstractCollectionListControl.Type! {
        return nil
    }
    
    // This instance define the AbstractCollectionListControl
    var _collectionControl: AbstractCollectionListControl!
    var collectionControl: AbstractCollectionListControl! {
        if collectionClass == nil {
            return nil
        }
        if _collectionControl == nil {
            _collectionControl = collectionClass.init(collectionViewLayout: UICollectionViewLayout())
            _collectionControl.customDelegate = self
        }
        return _collectionControl
    }
    
    /**
        This function is the delegate of collectionList View
        - Author:  Nitesh Garg
        - Returns: Void
        - Parameters:
        - model: This is the value/data pass in the cell
        */
    func updateListModel(_ model: AnyObject) {}
    
    // MARK: - Misc
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //This setup the style for the statusBar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .default
        }
    }
}

// MARK: AbstractViewModelProtocol
/**
 These protocols is used for passing the data from viewModel to controller
 - Author:  Nitesh Garg
 - Date:  June 25 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */
extension UIViewController: AbstractViewModelProtocol {
    
    //Override this method for getting the the data in viewcontroller
    func getServiceData(_ response: AnyObject) { }
    /**
     This function is used for show the alert Errormessage.
     - Author:  Nitesh Garg
     - Returns: Void
     - Remark:
     - Parameter error: This parameter contain the error message.
     */
    func showErrorMessage(_ error: Error) {
        stopLoader()
        presentAlertControl(title: ConstantStore.appName, message: (error as! CustomError).loggableDescripiton, buttons: [AlertButton.ok])
    }
    
    /**
     It present the **Alert Controller** on the screen.
     - Author:  Nitesh Garg
     - Returns: Void
     - Parameters:
     - title: It describe the title for the  **AlertController**.
     - message: It describe the message for the  **AlertController**.
     - buttons: It describe the number of buttons in **AlertController**.
     */
    func presentAlertControl(title: String, message: String, buttons: [String] = [AlertButton.ok])  {
        UIApplication.visibleViewController.present(UIAlertController.alert(title, message: message, buttons: buttons, completion: nil), animated: true, completion: nil)
    }
    
    /**
     This function start the activityIndicator bar.
     - Author:  Nitesh Garg
     - Returns: Void
     - Remark:
     */
    func startLoader() {
        guard DSActivityIndicator.window != nil else {
            DSActivityIndicator.window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            return
        }
        DSActivityIndicator.start()
    }
    
    /**
     This function stop the activityIndicator bar.
     - Author:  Nitesh Garg
     - Returns: Void
     - Remark:
     */
    func stopLoader() {
        DSActivityIndicator.stop()
    }
}



