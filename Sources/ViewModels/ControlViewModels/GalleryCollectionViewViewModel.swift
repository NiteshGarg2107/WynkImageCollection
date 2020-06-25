//
//  GalleryCollectionListViewModel.swift
//  Wynk-ImageCollection
//
//  Created by Nitesh Garg on 24/06/20.
//  Copyright © 2020 Nitesh Garg. All rights reserved.
//

import Foundation

/**
 These protocol is used for **DSOrderInstructionControl** Class.
 - Author:  Nitesh Garg
 - Date: Nov 06, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */

@objc protocol GalleryCollectionControlViewModelProtocol: AbstractViewModelProtocol {}

/**
 This class define the viewModel for **DSOrderInstructionControl**
 - Author:  Nitesh Garg
 - Date: Nov 06, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
struct GalleryCollectionControlViewModel {
    ///Don't forget to hook the delegate with class
    weak var delegate: GalleryCollectionControlViewModelProtocol!
}

/**
 This extension denote the extended functionality of **DSOrderInstructionControl** class.
 - Author:  Nitesh Garg
 - Date: Nov 06, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
extension GalleryCollectionControlViewModel {    
    /**
    This  function is used for save the details.
    - Author:  Nitesh Garg
    - Returns: Closure
    - Remark:
    - Parameters
    */
    func getSearchData(completion: (_ result: Bool, _ data: Array<Any>) -> Void) {
        CoreDaraManager.manager.getSearchText { (success, data) in
            if success {
                completion(true, Array(NSOrderedSet(array: data.map{$0.searchText ?? ""}.reversed())))
            } else{
                completion(false, [])
            }
        }
    }
}
