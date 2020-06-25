//
//  CoreDataManager.swift
//  StackSwiftUI
//
//  Created by Nitesh Garg on 02/04/20.
//  Copyright © 2020 Nitesh Garg. All rights reserved.
//

import Foundation
import CoreData

/**
This class is used for the implementing the core data functionality.
- Author:  Nitesh Garg
- Date:  April 17, 2020
- Copyright: © 2020 Assignment-4. All rights reserved.
*/
class CoreDaraManager {
    //class objects
    static let manager = CoreDaraManager(context: NSManagedObjectContext.current)
    var moc: NSManagedObjectContext
    
    //init function
    init(context: NSManagedObjectContext) {
        self.moc = context
    }
    
    /**
        This  function is used for get the  Search text .
        - Author:  Nitesh Garg
        - Returns: [ProjectList]
        - Remark:
        - Parameters
        */
    func getSearchText(completion: (_ result: Bool, _ searchData: [SearchTable]) -> Void) {
        let fetchRequest: NSFetchRequest<SearchTable> = SearchTable.fetchRequest()
        var projData = [SearchTable]()
            do {
              projData =  try moc.fetch(fetchRequest)
              completion(true, projData)
            } catch let error as NSError {
                completion(false, [])
                print(error)
            }
    }
    
    /**
       This  function is used for save the searchText.
       - Author:  Nitesh Garg
       - Returns: Void
       - Remark:
       - Parameters
    */
    func saveText(data: String, completion: (_ result: Bool) -> Void) {
        let projObject = SearchTable(context: moc)
        projObject.searchText = data
            do {
                try moc.save()
                completion(true)
        } catch let error as NSError {
            print(error)
            completion(false)
        }
    }
}
