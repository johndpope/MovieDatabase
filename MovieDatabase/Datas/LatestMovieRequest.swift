//
//  TopRatedRequest.swift
//  MovieDatabase
//
//  Created by ilkay sever on 12.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Alamofire

struct LatestMovieRequest : RequestResultObjectDelegate {
    typealias ResultObject = LatestModel

    var path: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.default
    
    init() {
        
        parameters = [:]
        path = "/movie/latest"
        parameters?["api_key"] = "c8663b3a5e6e1d41ab253805b21e4d6e"
        parameters?["language"] = "tr"
    }
    
}
