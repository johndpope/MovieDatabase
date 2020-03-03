//
//  TvSeriesModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 28.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Foundation

struct TvSeriesModel: Codable {
    var page: Int!
    var total_pages: Int!
    var total_results: Int!
    var results: [TvSeriesResponse]!
}

struct TvSeriesResponse: Codable {
    var id: Int!
    var name: String!
    var voteAverage: Double!
    var firstAirDate: String!
    var backdropPath: String?
    var posterPath: String!
    var description: String!
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case description = "overview"
        case voteAverage = "vote_average"
    }
}


