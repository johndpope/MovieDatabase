//
//  UpComingRequest.swift
//  MovieDatabase
//
//  Created by ilkay sever on 5.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Alamofire

struct UpComingRequest : RequestResultObjectDelegate {
    typealias ResultObject = MovieModel

    var path: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.default
    
    init(page: Int!) {
        parameters = [:]
        parameters?["page"] = page
        path = "/movie/upcoming"
        parameters?["api_key"] = "c8663b3a5e6e1d41ab253805b21e4d6e"
        //parameters?["language"] = "tr"
    }
    
}
