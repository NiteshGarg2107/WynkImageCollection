//import UIKit
import Alamofire

/**
 This class define the userAPI Store which is used for call the API and get the result for further process
 - Author:  Nitesh Garg
 - Date: June 25 2020 
 - Copyright: © 2020 Wynk. All rights reserved.
 */

class UserStore: APIStore, GettableUserStore {

    ///Private init method for singleton class
    private override init() {}
    
    ///Single Shared instance for access the function of the class
    static let shared = UserStore()
    
    //This function is called when User try to signup from the App.
    func getGalleryData(parameters: [String: AnyObject], Completion: @escaping (_ result: ResultData<Response<[GalleryData]>>) -> Void) {
        requestApiWithoutImage(parameters: parameters, URL: APIBaseURLStore.kGetDataAPI, modelclass: Response<[GalleryData]>.self) { (result) in
            switch result {
            case .success(let value):
                Completion(self.checkResponse(value: value))
            case .failure(let error):
                Completion(ResultData.failure(error))
            }
        }
    }
}

// MARK: UserStore Extension
/**
 This is used for extend the functionality of the **UserStore** class
 - Author:  Nitesh Garg
 - Date: June 25, 2018
 - Copyright: © 2020 Wynk. All rights reserved.
 */
extension UserStore {
    
    /**
     This function is used for calling the webservice and get the result
     - Author:  Nitesh Garg
     - Returns: Void
     - Remark:
     - Parameters:
        - parameters: Define the parameters for the webservice.
        - URL: Define the **URL/API**.
        - method: This define **HTTPMethod** type of the webservice.
     */
    func requestApiWithoutImage<T: Codable>(parameters: [String: AnyObject], URL: String, method: HTTPMethod = .get, header: [String: String] = [:], modelclass: T.Type, Completion: @escaping (_ result: ResultData<T>) -> Void) {
            requestAPI(URL, parameters: parameters, method: method) { (responseData, error) in
                guard responseData == nil else {
                    do {
                        let data = try JSONDecoder().decode(modelclass, from: responseData!)
                        return Completion(ResultData.success(data))
                    } catch let error {
                        return Completion(ResultData.failure(error))
                    }
                }
            Completion(ResultData.failure(CustomError.errorMessage((error?.localizedDescription)!)))
            }
    }
    
    /**
     This fundtion is used for check the response fetch from the server.
     - Author:  Nitesh Garg
     - Returns: ResultData<T>
     - Remark: This function is return the result after checking the response.
     - Parameters:
     - value: define the response fetch from the server
     */
    func checkResponse<T: Codable>(value: Response<T>) -> ResultData<Response<T>> {
        if ((value.errorMsg) == nil) {
            return ResultData.success(value)
        } else {
            return ResultData.failure(CustomError.errorMessage(value.errorMsg!))
        }
    }
}
