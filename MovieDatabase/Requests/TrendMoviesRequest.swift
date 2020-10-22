//
//  TrendMoviesRequest.swift
//  MovieDatabase
//
//  Created by ilkay on 22.10.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Alamofire

struct TrendMoviesRequest: RequestResultObjectDelegate {
    typealias ResultObject = TrendMovieModel
    
    var path: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.default
    
    init(page: Int!) {
        parameters = [:]
        parameters?["page"] = page
        path = "/trending/movie/day"
        parameters?["api_key"] = "c8663b3a5e6e1d41ab253805b21e4d6e"
        //parameters?["language"] = "tr"
    }
    
}
