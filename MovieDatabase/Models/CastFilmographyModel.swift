//
//  CastFilmographyModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 3.03.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Foundation

struct CastFilmographyModel: Codable {
    var cast: [CastFilmographyResponse]!
}

struct CastFilmographyResponse: Codable {
    var id: Int!
    var creditId: String!
    var title: String!
    var voteAverage: Double!
    var posterPath: String!
    var description: String!
    var backdropPath: String!
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case creditId = "credit_id"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case description = "overview"
        case backdropPath = "backdrop_path"
    }
}

