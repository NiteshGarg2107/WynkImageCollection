//
//  IndicatoView.swift
//  DiligentServices
//
//  Created by Admin on 22/08/2018.
//  Copyright © 2020 Wynk. All rights reserved.
//

import Foundation
import UIKit
/**
 This class define the ActivityIndicator class of type NSobject.
 - Author:  Nitesh Garg
 - Date: June 24, 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */
class DSActivityIndicator: NSObject {
    
    /**
     This Property Observer define the IndicatorView Class which is used for showing on the Window
     - Author:  Nitesh Garg
     - Returns: Void
     - Remark: This Add the IndicatorLoaderView on the Window and start the animation
     */
    static var window: UIWindow? = UIApplication.shared.windows.filter {$0.isKeyWindow}.first {
        didSet {
            start()
        }
    }

    ///IndicatorView
   static var indicatorView = IndicatorLoaderView()
    /**
     This function is used for start the animation of the indicatorView class
     - Author:  Nitesh Garg
     - Returns: Void
     - Remark:
     */
   static func start() {
        guard window != nil else {
            return
        }
    indicatorView.frame = (window!.frame)
    window?.addSubview(indicatorView)
        indicatorView.startAnimation()
    }
    
    /**
     This function is used for stop the animation of the indicatorView class
     - Author:  Nitesh Garg
     - Returns: Void
     - Remark:
     */
    static func stop() {
        indicatorView.removeFromSuperview()
        indicatorView.stopAnimation()
    }
}

/**
 This class define the **IndicatorLoaderView** class which contain the **InstagramActivityIndictor** Class
 - Author:  Nitesh Garg
 - Date: June 24, 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */
class IndicatorLoaderView: UIView {
    var indicator = InstagramActivityIndicator()
    
    //convenience method of the class
    convenience init(){
        self.init(frame: CGRect.zero)
    }
    
    //designated method of the class
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.2117647059, blue: 0.2980392157, alpha: 1)
        self.alpha = 0.5
        initViews()
    }
    
    /**
     This function set the indicator frame of the ActivityIndicator View.
     - Author:  Nitesh Garg
     - Returns: Void
     - Remark:This function the frame add on the view
     */
    func initViews() {
        addSubview(indicator)
    }
    
    //Required Method of the class
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///This function start the animation of the indicatorView
    func startAnimation() {
        indicator.startAnimating()
        self.isHidden = false
    }
    
     ///This function stop the animation of the indicatorView
    func stopAnimation() {
        indicator.stopAnimating()
        self.isHidden = true
    }
    
    //Setup layout SubViews
    override func layoutSubviews() {
        super.layoutSubviews()
        addConstraintToFillSuperview()
        addConstraintSameCenterXY(self, and: indicator)
        _ = indicator.addConstraintForWidth(100)
        _ = indicator.addConstraintForHeight(100)
    }
}
