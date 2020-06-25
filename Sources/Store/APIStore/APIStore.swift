//  APIStore.swift
import UIKit
import Alamofire

/**
 It define the extension of API store class.
 - Author:  Nitesh Garg
 - Date: June 23, 2020
 - Copyright: © 2020 Wynk. All rights reserved.
 */
class APIStore {
    /**
     This functio is used for request the api with image from the server.
     - Author:  Nitesh Garg
     - Returns: Void
     - Remark: It fetch the data from the server and pass into the BaseAPI Model class.
     - Parameters:
        - parameters: These are the parameters which passed into the server.
        - url: It define the url of the of the webService.
     */
    func requestAPI(_ url: URLConvertible, parameters: Parameters? = nil, method: HTTPMethod, completion: @escaping (_ : Data?, _ : Error?) -> Void){
        AF.request(url, method: method, parameters: parameters)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
            self.getValidDict(result: response.result, completion: { (dict, error) in
                if dict != nil {
                    completion(response.data, nil)
                } else {
                    completion(nil, response.error!)
                }
            })
        }
    }
    /**
     It is used to check the result fetch from the server is correct or not.
     - Author:  Nitesh Garg
     - Returns: Void
     - Remark:
     - Parameters:
        - result: It is the result which is get from the server.
     */
    func getValidDict(result: Result<Any, AFError>, completion: @escaping (_ : NSDictionary?, _ : NSError?) -> Void) {
        var dict: NSDictionary!
        switch result {
        case .success(let data):
            dict = (data as! NSDictionary)
            completion (dict, nil)
        case .failure(let error):
            completion (dict, error as NSError)
        }
    }
}
