//
//  FavoriteMovieRequest.swift
//  MovieDatabase
//
//  Created by ilkay sever on 26.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Alamofire

struct FavoriteMovieRequest : RequestResultObjectDelegate {
    
    enum ListType: String {
        case favorite = "favorite"
        case watchlist = "watchlist"
    }
    
    typealias ResultObject = ListModel
    
    var id: Int!
    var path: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var enconding: ParameterEncoding? = URLEncoding.default
    
    init(id: Int, sessionId: String, listType: ListType) {
        parameters = [:]
        path = "/account/\(id)/\(listType.rawValue)/movies"
        parameters?["session_id"] = sessionId
        parameters?["api_key"] = "c8663b3a5e6e1d41ab253805b21e4d6e"
    }
    
}
