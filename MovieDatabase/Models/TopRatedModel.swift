//
//  TopRatedModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 18.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Foundation

struct TopRatedModel: Codable {
    var page: Int!
    var results: [TopRatedResponse]!
}

struct TopRatedResponse: Codable {
    var id: Int!
    var title: String!
    var backdropPath: String!
    var description: String!
    
    private enum CodingKeys: String, CodingKey{
        case id
        case title
        case backdropPath = "backdrop_path"
        case description = "overview"
    }
}
