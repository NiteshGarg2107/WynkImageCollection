/**
 This enum define the parameters for the APIBaseURLStore.
 - Author:  Nitesh Garg
 - Date: June 23, 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */
//create enum
//enum
enum  APIBaseParameter {
    //Base URL of the API
    static let kbaseURL = "https://pixabay.com/api/"
    
}

/**
 This structure define the URL for the APIBaseURLStore.
 - Author:  Nitesh Garg
 - Date: June 23, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
enum APIBaseURLStore {
    ///BaseUrl of the Server
    static let baseURL: String = {
        return APIBaseParameter.kbaseURL
    }()
    
    ///BaseUrl of the Server for API
   private static let apiBaseURL: String = {
        return baseURL
    }()
    
// MARK: API Services
    //Get Data API
    static let kGetDataAPI =                      "\(apiBaseURL)"
}
