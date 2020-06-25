//
//  GalleryFullImageControl.swift
//  Wynk-ImageCollection
//
//  Created by Nitesh Garg on 24/06/20.
//  Copyright © 2020 Nitesh Garg. All rights reserved.
//

import UIKit

/**
This define  the class for **GalleryFullImageControl**.
- Author:  Nitesh Garg
- Date: 25 June, 2020
- Copyright: © 2020 Wynk. All rights reserved.
*/
class GalleryFullImageControl: AbstractControl {
    
    /**
      This define the collection class foe **AbstractCollectionListControl**
    - Author:  Nitesh Garg
    - Returns: AbstractCollectionListControl.Type!
    - Parameters:
    */
    override var collectionClass: AbstractCollectionListControl.Type! {
        return GalleryFullImageListControl.self
    }
    
    //VeiwDidLoad method
    override func viewDidLoad() {
        title = (model as! ModelObjectValue).searchText
        (collectionControl as! GalleryFullImageListControl).dataItems = model
        super.viewDidLoad()
    }
}
