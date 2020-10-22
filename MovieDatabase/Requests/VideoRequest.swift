//
//  VideoRequest.swift
//  MovieDatabase
//
//  Created by ilkay sever on 6.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Alamofire

struct VideoRequest: RequestResultObjectDelegate {
    typealias ResultObject = VideoModel

    var path: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.default
    
    init(movieId: Int) {
        parameters = [:]
        path = "/movie/\(movieId)/videos"
        parameters?["api_key"] = "c8663b3a5e6e1d41ab253805b21e4d6e"
    }
    
}
