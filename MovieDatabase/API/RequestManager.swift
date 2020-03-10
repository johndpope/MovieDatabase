//
//  RequestManager.swift
//  airGsm-ios
//
//  Created by Alihan Aktay on 27.06.2019.
//  Copyright © 2019 Alihan Aktay. All rights reserved.
//

import Alamofire

class RequestManager {
    
    typealias ObjectClosure<T: Codable> = ((T) -> Void)
    typealias ErrorClosure = ((ResponseError) -> Void)

    static let errorCodeConnection = "error.connection"
    static let errorCodeLocal = "error.local"
    static let errorCodeUnknown = "error.unknown"
    
    static var apiUrl: String {
        get {
            return "https://api.themoviedb.org/3"
        }
    }
    
    //MARK: - Image Urls
    static var imageBaseUrl500: String {
        get {
            return "https://image.tmdb.org/t/p/w500"
        }
    }
    
    private static func createRequest(_ request: RequestDelegate) -> DataRequest {
        print("\n\nRequest Path: \(apiUrl)\(request.path)")
        print("Request Method: \(request.method.rawValue)")
        print("Request Parameters:")
        print(request.parameters ?? "nil")
        
        let request  = Alamofire.request(apiUrl+request.path, method: request.method, parameters: request.parameters, encoding: request.enconding!, headers: generateHeader())
        request.validate()
        request.responseData { (response) in
            if let value = response.result.value {
                if let json = String(data: value, encoding: .utf8) {
                    print("Response JSON: \n\(json)")
                }
            }
        }
        return request
    }
    
    static func request<T: Codable>(_ request: RequestDelegate, success: @escaping ObjectClosure<T>, failure: @escaping ErrorClosure) {
        let request = createRequest(request)
        request.responseData { (response) in
            switch response.result {
            case .success:
                success(T.decode(response.result.value!)!)
            case .failure:
                handleFailure(response: response, failure: failure)
            }
        }
    }
    
    private static func handleFailure(response: DataResponse<Data>, failure: @escaping ErrorClosure) {
        if let statusCode = response.response?.statusCode, statusCode == 401 {
            return
        }
        if let statusCode = response.response?.statusCode, statusCode == 302{
            if let data = response.data, let serviceError = ResponseError.decode(data) {
                if let json = String(data: data, encoding: .utf8) {
                    print("Response JSON: \(json)")
                }
                serviceError.code = "302"
                handleError(statusCode: response.response?.statusCode, localError: nil, serviceError: serviceError, failure: failure)
                print("Error = \(String(describing: response.response?.statusCode))")
            }
            return
        }
        if let data = response.data, let serviceError = ResponseError.decode(data) {
            if let json = String(data: data, encoding: .utf8) {
                print("Response JSON: \(json)")
            }
            handleError(statusCode: response.response?.statusCode, localError: nil, serviceError: serviceError, failure: failure)
            print("Error = \(String(describing: response.response?.statusCode))")
        } else if let error = response.result.error {
            handleError(statusCode: nil, localError: error, serviceError: nil, failure: failure)
            print("Error = \(String(describing: failure))")
        } else {
            handleError(statusCode: nil, localError: nil, serviceError: nil, failure: failure)
            print("Error = \(String(describing: failure))")
        }
    }
    
    private static func handleError(statusCode: Int?, localError: Error?, serviceError: ResponseError?, failure: @escaping ErrorClosure) {
        if let error = serviceError {
            failure(error)
        } else if let error = localError as? URLError, error.code == .notConnectedToInternet {
            failure(ResponseError(code: errorCodeConnection, message: error.localizedDescription))
            print("Error = \(error.localizedDescription)")
        } else if let error = localError {
            failure(ResponseError(code: errorCodeLocal, message: error.localizedDescription))
            print("Error = \(error.localizedDescription)")
        } else {
            failure(ResponseError(code: errorCodeUnknown, message: "Unknow Error"))
        }
    }
    
    private static func generateHeader() -> [String: String]? {
        var parameters: [String: String] = [:]
        parameters["Accept-Language"] = "tr"
 
        print("Header:")
        print(parameters)
        return parameters
    }
    
}
