//
//  GenreRequest.swift
//  MovieDatabase
//
//  Created by ilkay sever on 4.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Alamofire

struct GenreRequest : RequestResultObjectDelegate {
    typealias ResultObject = GenreModel

    var path: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.default
    
    init() {
        
        parameters = [:]
        path = "/genre/movie/list"
        parameters?["api_key"] = "c8663b3a5e6e1d41ab253805b21e4d6e"
        parameters?["language"] = "tr"
    }
    
}
