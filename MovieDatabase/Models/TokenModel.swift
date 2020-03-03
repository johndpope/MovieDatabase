//
//  TokenModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 24.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Foundation

struct TokenModel: Codable {
    var requestToken: String!
    
    enum CodingKeys: String, CodingKey {
        case requestToken = "request_token"
    }
}
