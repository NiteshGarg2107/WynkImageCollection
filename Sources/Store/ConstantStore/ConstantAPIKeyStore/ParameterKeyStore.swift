import UIKit
/**
 This function define the parameter keys for the **Constant ParameterKeys**
 - Author:  Nitesh Garg
 - Date: June 25 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */
enum ConstantParameterKeys {
    static let key = "key"
    static let keyValue = "17173870-1354e798802153a0d6d7e564a"
        //Wrong key
//      static let keyValue  = "adsasasdsad"
}

/**
 This function define the parameter keys for the **GalleryParameterKeys**
 - Author:  Nitesh Garg
 - Date: June 25 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */
enum GalleryParameterKeys {
    static let searchText = "q"
    static let type = "image_type"
    static let pageNumber = "page"
    static let perLimit = "per_page"
}

/**
This function define the parameter keys for the **GalleryConstantStore**
- Author:  Nitesh Garg
- Date: June 25 2020
- Copyright: © 2020 Wynk. All rights reserved.
*/
enum GalleryConstantStore {
    static let noItemsText = "No Data Found"
    static let title = "Wynk-ImageCollection"
    static let photo = "photo"
}

/**
This function define the structure for the **ModelObjectValue**
- Author:  Nitesh Garg
- Date: June 25 2020
- Copyright: © 2020 Wynk. All rights reserved.
*/
struct ModelObjectValue {
    var data: Array<Any>
    var index: IndexPath
    var offset: String
    var searchText: String
}
