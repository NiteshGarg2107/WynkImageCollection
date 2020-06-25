/**
 This protocol define for user store with associatedType
 - Author:  Nitesh Garg
 - Date: June 25, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */

//sourcery: AutoMockable
protocol GettableUserStore {
    
    /**
     This function is used for get the orderlist of Services for newOrder class.
     - Author:  Nitesh Garg
     - Returns: Void
     - Remark:
     - Parameters:
        - parameters: Define the parameters for the webservice.
        - URL: Define the **URL/API**.
        - method: This define **HTTPMethod** type of the webservice.
     */
    //This function is called for getting the data.
    func getGalleryData(parameters: [String: AnyObject], Completion: @escaping (_ result: ResultData<Response<[GalleryData]>>) -> Void)
}
