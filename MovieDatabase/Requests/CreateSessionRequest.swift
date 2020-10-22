//
//  CreateSessionRequest.swift
//  MovieDatabase
//
//  Created by ilkay sever on 24.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Alamofire

struct CreateSessionRequest: RequestResultObjectDelegate {
    
    typealias ResultObject = SessionModel
    
    var path: String
    var method: HTTPMethod = .post
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.httpBody
    
    init(token:String) {
        parameters = [:]
        parameters!["request_token"] = token
        path = "/authentication/session/new?api_key=c8663b3a5e6e1d41ab253805b21e4d6e"
    }
    
}
