//
//  SeriesCastRequest.swift
//  MovieDatabase
//
//  Created by ilkay sever on 17.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Alamofire

struct SeriesCastRequest : RequestResultObjectDelegate {
    
    typealias ResultObject = SeriesCastModel
    
    var id: Int!
    var path: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.default
    
    init(id: Int) {
        
        parameters = [:]
        path = "/tv/\(id)/credits"
        parameters?["api_key"] = "c8663b3a5e6e1d41ab253805b21e4d6e"
        //parameters?["language"] = "tr"
    }
    
}
