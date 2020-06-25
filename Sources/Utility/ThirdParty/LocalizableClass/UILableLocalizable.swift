import UIKit
/**
 This class define the Localizable TextView for the textView class
 - Author:  Nitesh Garg
 - Date: Aug 23, 2018
 - Copyright: © 2018 DiligentServices. All rights reserved.
 */
final class UILocalizedTextView: UITextView {
    
    ///Caption text for TextView
    var captionText: String {
        //Localised file
//        return CreatePostLocalizable.captionText.localized
        
    return ""
    }
    
    //called when loaded on the viewcontroller.
    override func awakeFromNib() {
        super.awakeFromNib()
        text =  captionText
        addObserver()
    }
    
    /**
     This function is called when text is changed in the textView.
     - Author:  Nitesh Garg
     - Returns: Void
     */
    @objc func textDidChange() -> Void {}
    
    /**
     This function is called when text is began editing in the textView.
     - Author:  Nitesh Garg
     - Returns: Void
     */
    @objc func textDidBegainEditing() -> Void {
        if text == captionText {
            text = ""
            textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
    
    /**
     This function is called when text did end editing in the textView.
     - Author:  Nitesh Garg
     - Returns: Void
     */
    @objc func textDidEndEditing() -> Void {
        if text.isEmpty {
            text = captionText
            textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        }
    }
    
    ///Array of tuple data which we have to pass in the Observer.
    var observerData: [(selector: Selector, aName: NSNotification.Name?, anObject: Any?)] {
        return [(selector: #selector(self.textDidBegainEditing), aName:                                     NSNotification.Name.UITextViewTextDidBeginEditing, anObject: nil), 
                (selector: #selector(self.textDidChange), aName: NSNotification.Name.UITextViewTextDidChange, anObject: nil), 
                (selector: #selector(self.textDidEndEditing), aName: NSNotification.Name.UITextViewTextDidEndEditing, anObject: nil)]
    }
    
    /**
     Used this function to add the observer for the textView
     - Author:  Nitesh Garg
     - Returns: Void
     */
    func addObserver() {
        addViewObservers(input: observerData)
    }
    
    ///Remove all the observer when deinit is called.
    deinit {
        removeObservers(input: observerData)
    }
    
}
