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
This define the class for **GalleryCollectionListControl**.
- Author:  Nitesh Garg
- Date: 25 June, 2020
- Copyright: © 2020 Wynk. All rights reserved.
*/
class GalleryCollectionListControl: AbstractCollectionListControl, GalleryCollectionListViewModelProtocol {
    
    //Member of the class
    private var viewModel = GalleryCollectionListViewModel()
    var searchText: String = ""
    
    //MARK: This define the CellClass of the collectionView
    override var cellClass: AbstractCollectionCell.Type {
        return GalleryCollectionViewCell.self
    }
    
    //ViewDidLoad Method
    override func viewDidLoad() {
        super.viewDidLoad()
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
        //Check if searchtext is empty
        if searchText == "" {
            noItemsText = GalleryConstantStore.noItemsText
            completion([], nil, false)
        } else {
            startLoader()
            //Call API for getting the data
            viewModel.getGalleryData(parameters:  [ConstantParameterKeys.key: ConstantParameterKeys.keyValue as AnyObject,GalleryParameterKeys.searchText: searchText as AnyObject, GalleryParameterKeys.type: GalleryConstantStore.photo as AnyObject, GalleryParameterKeys.pageNumber: ((offset + itemsPerPage)/20).string as AnyObject, GalleryParameterKeys.perLimit: String(limit) as AnyObject]) { (result) in
                    self.stopLoader()
                    if result.total == 0 {
                        self.noItemsText = GalleryConstantStore.noItemsText
                        self.presentAlertControl(title: GalleryConstantStore.title, message: GalleryConstantStore.noItemsText)
                        completion([], nil, false)
                    } else {
                        self.viewModel.saveSearchText(text: self.searchText) { (success) in}
                        completion(result.data, nil, offset < result.total ?? 00 )
                    }
            }
        }
    }
    
    //MARK: Did Select method for collectionView
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(searchText)
        _ = NavigatorWithObject<GalleryFullImageControl>(modelObject:  ModelObjectValue(data: self.items, index: indexPath, offset: ((offset + itemsPerPage)/20).string, searchText: self.searchText) as AnyObject)
    }
}
