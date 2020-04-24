//
//  SeriesModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 28.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Foundation

struct SeriesModel: Codable {
    var page: Int!
    var total_pages: Int!
    var total_results: Int!
    var results: [SeriesElements]!
}

struct SeriesElements: Codable {
    var id: Int!
    var title: String!
    var voteAverage: Double!
    var releaseDate: String!
    var backdropPath: String?
    var posterPath: String!
    var description: String!
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "name"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case releaseDate = "first_air_date"
        case description = "overview"
        case voteAverage = "vote_average"
    }
}


