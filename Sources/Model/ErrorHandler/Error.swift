//
//  Error.swift
//  DiligentServices
//
//  Created by Admin on 22/8/2018.
//  Copyright © 2020 Wynk. All rights reserved.
//
/**
 This enum is used for handle the result which we get from the server and if response is ger properly than handle the result and custom error.
 - Author:  Nitesh Garg
 - Date: June 22, 2018
 - Copyright: © 2020 Wynks. All rights reserved.
 */
protocol LoggableError: Error {
    var loggableDescripiton: String { get }
}

/**
 This enum is used for shownig Service Error Message .
 - Author:  Nitesh Garg
 - Date: June 22, 2020
 - Copyright: © 2020 Wynks. All rights reserved.
 */
enum CustomError: Error, LoggableError {
    ///If Internet connection is lost
    case connectionLost(String)
    ///If any error message get from service.
    case errorMessage(String)
    ///if any textfield error message
    case ValidationErrorMessage(String)
    
    ///DISCRIPTION OF ERROR MESSAGE
    var loggableDescripiton: String {
        switch self {
        case .connectionLost(let error):
            return error
        case .errorMessage(let errorInfo):
            return errorInfo
        case .ValidationErrorMessage(let errorMessage):
            return errorMessage.localized
        }
    }
}

/**
 Use this enum for geeting the error message from the Localised  String.
 - Author:  Nitesh Garg
 - Date: June 22, 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */
enum AlertMessages: String {
    case inValidEmail = "Please enter a valid email."
    case invalidFirstLetterCaps = "invalidFirstLetterCaps"
    case inValidPhone = "Please enter a valid phone no."
    case invalidAlphabeticString = "invalidAlphabeticString"
    case inValidPSW = "Please enter a valid password."
    
    case emptyPhone = "Phone No. is required."
    case emptyEmail = "Email is required."
    case emptyFirstLetterCaps = "emptyFirstLetterCaps"
    case emptyAlphabeticString = "emptyAlphabeticString"
    case emptyPSW = "Password is required."
    case  orderDetails_ServiceAdd = "You must add a service to this order before timing in."
    case  cancelOrder = "Are you sure you want to cancel this order?"
    case creditCard = "Please enter a credit card info."
    case checkInfo = "Please enter the cheque number."
    case sendReport = "Report sent successfully"
}
/**
 This enum define the Alert type of the text.
 - Author:  Nitesh Garg
 - Date: June 25 2020 
 - Copyright: © 2020 Wynk. All rights reserved.
 */
enum Alert {
    case success
    case failure
    case error
}

//Validation on TextField
enum Valid {
        case success
        case failure(Alert, Error)
    
        /// Returns `true` if the result is a success, `false` otherwise.
        public var isSuccess: Bool {
            switch self {
            case .success:
                return true
            case .failure:
                return false
            }
        }
    }
