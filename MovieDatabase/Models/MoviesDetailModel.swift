//
//  MoviesDetailModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 13.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Foundation

struct MoviesDetailModel: Codable {
    var id: Int!
    var title: String!
    var releaseDate: String!
    var description: String!
    var backdropPath: String!
    var voteAverage: Double!
    
    enum CodingKeys: String, CodingKey{
        case id
        case title
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case description = "overview"
        case voteAverage = "vote_average"
    }
}
