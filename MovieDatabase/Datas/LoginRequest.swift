//
//  LoginRequest.swift
//  MovieDatabase
//
//  Created by ilkay sever on 24.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Alamofire

struct LoginRequest: RequestResultObjectDelegate {
    
    typealias ResultObject = TokenModel

    var path: String
    var method: HTTPMethod = .post
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.httpBody
    
    init(userName: String, password: String, token: String) {
        
        parameters = [:]
        parameters!["username"] = userName
        parameters!["password"] = password
        parameters!["request_token"] = token
        path = "/authentication/token/validate_with_login?api_key=c8663b3a5e6e1d41ab253805b21e4d6e"
        
    }
    
}
