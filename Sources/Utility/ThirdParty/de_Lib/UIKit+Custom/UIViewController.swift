//
//  UIViewController.swift
import UIKit

extension UIViewController {
    
    func isPresentedModally() -> Bool {
        return self.presentingViewController?.presentedViewController == self
    }
    
    func findContentViewControllerRecursively() -> UIViewController {
        var childViewController: UIViewController?
        if self is UITabBarController {
            childViewController = (self as? UITabBarController)?.selectedViewController
        } else if self is UINavigationController {
            childViewController = (self as? UINavigationController)?.topViewController
        } else if self is UISplitViewController {
            childViewController = (self as? UISplitViewController)?.viewControllers.last
        } else if self.presentedViewController != nil {
            childViewController = self.presentedViewController
        }
        let shouldContinueSearch: Bool = (childViewController != nil) && !((childViewController?.isKind(of: UIAlertController.self))!)
        return shouldContinueSearch ? childViewController!.findContentViewControllerRecursively() : self
    }
    
    func customAddChildViewController(_ child: UIViewController) {
        self.customAddChildViewController(child, toSubview: self.view)
    }
    
    func customAddChildViewController(_ child: UIViewController, toSubview subview: UIView) {
        self.addChild(child)
        subview.addSubview(child.view)
        child.view.addConstraintToFillSuperview()
        child.didMove(toParent: self)
    }
    
    func customRemoveFromParentViewController() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    func customRemoveAllChildViewControllers() {
        for control: UIViewController in self.children {
            control.customRemoveFromParentViewController()
        }
    }

    func popOrDismissViewController(_ animated: Bool) {
        if self.isPresentedModally() {
            self.dismiss(animated: animated, completion: nil)
        } else if self.navigationController != nil {
            _ = self.navigationController?.popViewController(animated: animated)
        }
    }
    
    func popToViewController(_ controllerType: UIViewController.Type, modelObj: AnyObject? = nil) -> AbstractControl? {
        for control in self.navigationController!.viewControllers as Array {
            if control.isKind(of: controllerType) {
                self.navigationController!.popToViewController(control, animated: true)
                return control as? AbstractControl
            }
        }
        return nil
    }
    
    func loadNibFile(_ name: String, owner: Any?, options: [AnyHashable: Any]? = nil) -> Void {
        Bundle.main.loadNibNamed(name, owner: owner, options: options as? [UINib.OptionsKey : Any])
    }
}
