//
//  GalleryCollectionListViewModel.swift
//  Wynk-ImageCollection
//
//  Created by Nitesh Garg on 24/06/20.
//  Copyright © 2020 Nitesh Garg. All rights reserved.
//

import Foundation

/**
 These protocol is used for **GalleryCollectionListViewModelProtocol** Class.
 - Author:  Nitesh Garg
 - Date: June 25, 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */

@objc protocol GalleryCollectionListViewModelProtocol: AbstractViewModelProtocol {}

/**
 This class define the viewModel for **GalleryCollectionListViewModel**
 - Author:  Nitesh Garg
 - Date: June 25, 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */
struct GalleryCollectionListViewModel {
    ///Don't forget to hook the delegate with class
    weak var delegate: GalleryCollectionListViewModelProtocol!
}

/**
 This extension denote the extended functionality of **GalleryCollectionListViewModel** class.
 - Author:  Nitesh Garg
 - Date: June 25, 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */
extension GalleryCollectionListViewModel {
    /**
    This  function is used for save the Search text.
    - Author:  Nitesh Garg
    - Returns: Closure
    - Remark:
    - Parameters
    */
    func saveSearchText(text: String, completion: (_ result: Bool) -> Void)  {
        CoreDaraManager.manager.saveText(data: text) { (success) in
            if success {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    /**
     This function is used for get the list of  data through API
     - Author:  Nitesh Garg
     - Returns: Void
     - Remark:
     - Parameter parameters: This define the parameters which we pass to the webs server.
     */
    func getGalleryData(parameters: [String: AnyObject], completion: @escaping (_ result: Response<[GalleryData]>) -> Void) {
        UserStore.shared.getGalleryData(parameters:parameters) { result in
            switch result {
               case .success(let value):
                   completion(value)
               case .failure(let error):
                   self.delegate.showErrorMessage!(error)
               }
        }
    }
}
