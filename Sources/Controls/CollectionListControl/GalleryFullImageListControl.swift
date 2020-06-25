//
//  GalleryCollectionListControl.swift
//  Wynk-ImageCollection
//
//  Created by Nitesh Garg on 24/06/20.
//  Copyright © 2020 Nitesh Garg. All rights reserved.
//

import Foundation
import UIKit

/**
This define the class for  **GalleryFullImageListControl**.
- Author:  Nitesh Garg
- Date: 25 June, 2020
- Copyright: © 2020 Wynk. All rights reserved.
*/
class GalleryFullImageListControl: AbstractCollectionListControl, GalleryCollectionListViewModelProtocol {
    /**
     This define the data items for the **GalleryFullImageListControl**.
     - Author:  Nitesh Garg
     - Returns: [MenuContents]
     */
    var dataItems: AnyObject? = nil
    var startScrolling = false
    
    //Member of the class
    private var viewModel = GalleryCollectionListViewModel()
    /**
     This define the data cell for the **GalleryFullImageListControl**.
     - Author:  Nitesh Garg
    */
    override var cellClass: AbstractCollectionCell.Type {
        return GalleryFullImageListCell.self
    }
    //ViewDidLoad Method
    override func viewDidLoad() {
        super.viewDidLoad()
        items = (dataItems as! ModelObjectValue).data
        offset = (dataItems as! ModelObjectValue).offset.int
        collectionView.isPagingEnabled = true
        refreshControl.removeFromSuperview()
        noItemsText = "No Data found"
        viewModel.delegate = self
    }
    
    /**
     it define the items for the collection list control.
     - Author:  Nitesh Garg
     - Returns: Void
     - Parameters:
        - query: Any query from the list control.
        - limit: limit of the list control.
        - offset: offset discription of the list control.
        - completion: in completion we have to pass Array of items,error and reloading.
     */
    override func requestItems(_ query: String, limit: NSInteger, offset: NSInteger, completion: @escaping (Array<Any>?, NSError?, Bool?) -> Void) {
        if startScrolling {
            startLoader()
            viewModel.getGalleryData(parameters: [ConstantParameterKeys.key: ConstantParameterKeys.keyValue as AnyObject,GalleryParameterKeys.searchText: (dataItems as! ModelObjectValue).searchText as AnyObject, GalleryParameterKeys.type: "photo" as AnyObject, GalleryParameterKeys.pageNumber: ((offset + itemsPerPage)/20).string as AnyObject, GalleryParameterKeys.perLimit: String(limit) as AnyObject]) { (result) in
                self.stopLoader()
                    completion(result.data, nil, offset < result.total ?? 00 )
            }
        } else {
            startScrolling = true
            completion(items, nil, true )
        }
    }
    
    //ViewDidAppear method
    override func viewDidAppear(_ animated: Bool) {
        collectionView.scrollToItem(at: (dataItems as! ModelObjectValue).index, at: .right, animated: false)
    }
}
