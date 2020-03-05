//
//  UserDetailRequest.swift
//  MovieDatabase
//
//  Created by ilkay sever on 26.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Alamofire
    
struct UserDetailRequest: RequestResultObjectDelegate {
    
    typealias ResultObject = UserModel
    
    var path: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.default
    
    init(sessionId: String) {
        
        parameters = [:]
        parameters!["session_id"] = sessionId
        parameters!["api_key"] = "c8663b3a5e6e1d41ab253805b21e4d6e"
        path = "/account"
    }
    
}
