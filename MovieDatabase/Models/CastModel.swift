//
//  CastModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 20.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Foundation

struct CastModel: Codable {
    var cast: [CastElements]!
}

struct CastElements: Codable {
    var castId: Int!
    var name: String!
    var gender: Int!
    var personId: Int!
    var creditId: String!
    var profilePath: String!
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case castId = "cast_id"
        case personId = "id"
        case creditId = "credit_id"
        case profilePath = "profile_path"
    }
    
}

