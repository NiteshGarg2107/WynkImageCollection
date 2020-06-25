//
//  NSManageObjectContext+Extension.swift
//  StackSwiftUI
//
//  Created by Nitesh Garg on 02/04/20.
//  Copyright © 2020 Nitesh Garg. All rights reserved.
//

import Foundation
import UIKit
import CoreData

/**
This extension create for makinf instances for main or background context for **NSManagedObjectContext** .
- Author:  Nitesh Garg
- Date:  April 17, 2020
- Copyright: © 2020 Assignment-4. All rights reserved.
*/
extension NSManagedObjectContext {
    
    //Instance for main context
     static var current: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    //Instance for backgorund context
    static var backGroundContext: NSManagedObjectContext {
           let appDelegate = UIApplication.shared.delegate as! AppDelegate
           let context = appDelegate.persistentContainer.newBackgroundContext()
           context.parent = NSManagedObjectContext.current
           return context
       }
}
