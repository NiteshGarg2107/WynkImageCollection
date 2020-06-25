import Foundation

/**
This struct define the Response Model for the API response which we fetch from the server.
 - Author:  Nitesh Garg
 - Date: June 27, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
struct Response<ModelObject: Codable>: Codable {
    
    // Status of the response
    let total: Int?
    // Error message for the response
    let errorMsg: String?
    // data of the response.
    let data: ModelObject?
    
    //This define the coding keys for the **Response<ModelObject: Codable>** class.
    private enum CodingKeys: String, CodingKey {
        case total, errorMsg = "msg", data = "hits"
    }
}

// MARK: Login user Model
/**
 This struct define the model for the **GalleryData**.
 - Author:  Nitesh Garg
 - Date: June 25, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
struct GalleryData: Codable {
    // values of **UserData**
    let pageURL: String?
    let type: String?
    let previewURL: String?
    let webformatURL: String?
    let largeImageURL: String?
}
