//
//  DefaultsEnums.swift
//  DiligentServices
//
//  Created by Admin on 25/08/2020.
//  Copyright © 2020 Wynk. All rights reserved.
//

// MARK: MediaTypeKeys
struct MediaTypeKeys {
    static let Kvideo: String = "video"
    static let Kphotos: String = "photos"
}

// MARK: Error messages of internet Connection
struct InternetConnectionKeys {
    static let KconnectionLost: String = "lostToInternet"
    static let KconnectToInternet: String = "connectToInternet"
}

// MARK: APIStoreKeys
struct APIStoreKeys {
    static let Image = "postImageUrl"
    static let result = "results"
    static let message = "dataFound"
}

/**
 This struct define the picker details for the time/
 - Author:  Nitesh Garg
 - Returns: Void
 */
struct DSTimePickerData {
    static let timeDetails = ["06:00 AM", "06:30 AM", "07:00 AM", "07:30 AM", "08:00 AM", "08:30 AM", "09:00 AM", "09:30 AM", "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM", "12:00 AM", "12:30 PM", "01:00 PM", "01:30 PM", "02:00 PM", "02:30 PM", "03:00 PM", "03:30 PM", "04:00 PM", "04:30 PM", "05:00 PM", "05:30 PM"]
}

// MARK: This define the constnat store through enum
/**
 This Enum define the cases for the section for the **DSOrderDetailsListControl**.
 - Author:  Nitesh Garg
 - Date: Oct 24, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */

// MARK: This define the constnat store for **DSDetailOrderSectionList**
enum DSDetailOrderSectionList: String, CaseIterable {
    // cases for the section list.
    case location = "Location", status = "Status", services = "Services", contacts = "Contacts", notes = "Notes"
    
    // init function for the **DSDetailOrderSectionList**
    init(index: Int) {
        switch index {
        case 0:
            self = .location
        case 1:
            self = .status
        case 2:
            self = .services
        case 3:
            self = .contacts
        case 4:
            self = .notes
        default:
            self = .location
        }
    }
}

/**
 This Enum define the cases for the section for the **DSEmailListControl**.
 - Author:  Nitesh Garg
 - Date: Oct 24, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */

// MARK: This define the constnat store for **DSEmailListControl**
enum DSEmailList: String, CaseIterable {
    // cases for the section list.
    case report = "Report", emails = "Emails", additionalMails = "Additional Mails"
    
    // init function for the **DSDetailOrderSectionList**
    init(index: Int) {
        switch index {
        case 0:
            self = .report
        case 1:
            self = .emails
        case 2:
            self = .additionalMails
        default:
            self = .report
        }
    }
}

/**
 This Enum define the cases for the section for the **DSInvoiceDetailsListControl**.
 - Author:  Nitesh Garg
 - Date: Oct 24, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */

// MARK: This define the constnat store for **DSEmailListControl**
enum DSInvoiceList: String, CaseIterable {
    // cases for the section list.
    case service = "Services", instruction = "Service Description"
    
    // init function for the **DSDetailOrderSectionList**
    init(index: Int) {
        switch index {
        case 0:
            self = .service
        case 1:
            self = .instruction
        default:
             self = .instruction
        }
    }
}

/**
 This enum is used for define the URL for navigate to the app.
 - Author:  Nitesh Garg
 - Date: Sep 5, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
enum AppURL {
    static let googleMapURL = "googleMapURL"
    static let appleMApURL = "googleMapURL"
//    static let appleMApURL = "appleMapURL"
    static let telephone = "telprompt:"
    static let mail = "mailto:"
}

/**
 This enum is used for define the Alert message for the URL.
 - Author:  Nitesh Garg
 - Date: Sep 5, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
enum AppURLAlertMessage {
    static let googleMapAlert = "googleMapURL"
    static let appleMapAlert = "appleMapURL"
    static let telephoneAlert = "telprompt:"
    static let mailAlert = "mailto:"
}

/**
 This enum is used for define the Dateformat for the date.
 - Author:  Nitesh Garg
 - Date: Sep 5, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
enum DateFormat {
    static let utcFormat = "utc"
    static let dateFormat = "date"
    static let apiDateFormat = "apiDateFormat"
    static let scheduledateFormat = "scheduledateFormat"
}

/**
 This enum define the bar button items for the the  ****
 - Author:  Nitesh Garg
 - Date: Oct 24, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
enum BottomBarItems: Int {
    case location = 0, phone = 1, message = 2, invoice = 3, scheduleDate = 4, notification = 5
}

/**
 This enum define the constant store for the app.
 - Author:  Nitesh Garg
 - Date: Oct 24, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
enum ConstantStore {
     static let appName = "Wynk"
     static let order = "Order #"
     static let orderInst = "Order Instructions: "
     static let location = "Location #"
     static let chracterLimit = 200
     static let orderType = "1"
     static let rescheduleError = "rescheduleError"
     static let notesMessage = "notesMessage"
     static let contactMessage = "contactMessage"
     static let additionalMail = "additionalMail"
     static let noDataIssue = "noDataIssue"
     static let signHere = "Sign here"
     static let clear = "Clear"
     static let publishedKey = "publishedKey"
     static let bin = "Bin #"
     static let totalCapacity = "Total Capacity:- "
}

/**
 This enum define the type for the signature for the app.
 - Author:  Nitesh Garg
 - Date: Dec 24, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
enum SignatureType: String {
    case Technician = "Technician Signature", Customer = "Customer Signature"
}
