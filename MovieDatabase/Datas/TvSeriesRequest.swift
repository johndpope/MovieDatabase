//
//  TvSeriesRequest.swift
//  MovieDatabase
//
//  Created by ilkay sever on 28.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Alamofire

struct TvSeriesRequest : RequestResultObjectDelegate {
    typealias ResultObject = SeriesModel

    var path: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.default
    
    init(page: Int!) {
        parameters = [:]
        parameters?["page"] = page
        path = "/tv/on_the_air"
        parameters?["api_key"] = "c8663b3a5e6e1d41ab253805b21e4d6e"
        //parameters?["language"] = "tr"
        
    }
    
}
