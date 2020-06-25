//
//  Result.swift
//  DiligentServices
//
//  Created by Admin on 09/05/2018.
//  Copyright © 2020 Wynks. All rights reserved.
//

import Foundation

/**
 This enum is used for handle the result which we get from the server and if response is ger properly than handle the result and custom error.
 - Author:  Nitesh Garg
 - Date: March 14, 2018
 - Copyright: © 2020 Wynks. All rights reserved.
 */
public enum ResultData<Value> {
    //Cases of REesult
    case success(Value)
    case failure(Error)
    
    /// Returns `true` if the result is a success, `false` otherwise.
    public var isSuccess: Bool {
        switch self {
        case .success:
            return true
        case .failure:
            return false
        }
    }
    
    /// Returns `true` if the result is a failure, `false` otherwise.
    public var isFailure: Bool {
        return !isSuccess
    }
    
    /// Returns the associated value if the result is a success, `nil` otherwise.
    public var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
    
    /// Returns the associated error value if the result is a failure, `nil` otherwise.
    public var error: Error? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
    
    ///Map the Result function
    public func map<T>(_ transform: (Value) -> T) -> ResultData<T> {
        switch self {
        case .success(let value):
            return .success(transform(value))
        case .failure(let error):
            return .failure(error)
        }
    }
    
}
