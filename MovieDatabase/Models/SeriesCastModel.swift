//
//  SeriesCastModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 17.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Foundation

struct SeriesCastModel: Codable {
    var id: Int!
    var cast: [SeriesCastElements]!
}

struct SeriesCastElements: Codable {
    var id: Int!
    var name: String!
    var character: String!
    var credit_id: String!
    var profile_path: String!
    
}
