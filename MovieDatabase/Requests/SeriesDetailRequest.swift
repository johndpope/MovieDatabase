//
//  SeriesDetailRequest.swift
//  MovieDatabase
//
//  Created by ilkay sever on 10.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Alamofire

struct SeriesDetailRequest: RequestResultObjectDelegate {
    
    typealias ResultObject = SeriesDetailModel

    var id: Int!
    var path: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.default
    
    init(id: Int) {
        parameters = [:]
        path = "/tv/\(id)"
        parameters?["api_key"] = "c8663b3a5e6e1d41ab253805b21e4d6e"
        parameters?["language"] = "tr"
    }
    
}
