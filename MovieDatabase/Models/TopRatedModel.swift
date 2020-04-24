//
//  TopRatedModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 18.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Foundation

struct TopRatedModel: Codable {
    var page: Int!
    var results: [TopRatedelements]!
}

struct TopRatedelements: Codable {
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
