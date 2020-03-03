//
//  AddWatchListRequest.swift
//  MovieDatabase
//
//  Created by ilkay sever on 2.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Alamofire

struct AddWatchListRequest: RequestResultObjectDelegate {
    
    typealias ResultObject = AddListModel
    
    var path: String
    var method: HTTPMethod = .post
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.httpBody
    
    init(id: Int, sessionId: String, mediaId: Int, watchlist: Bool) {
        
        parameters = [:]
        parameters!["account_id"] = id
        parameters!["session_id"] = sessionId
        parameters!["media_id"] = mediaId
        parameters!["watchlist"] = watchlist
        parameters!["media_type"] = "movie"
        parameters?["Content-Type"] = "application/json"
        path = "/account/\(id)/watchlist?api_key=c8663b3a5e6e1d41ab253805b21e4d6e"
    }
    
}
