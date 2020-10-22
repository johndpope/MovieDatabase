//
//  TrendMovieModel.swift
//  MovieDatabase
//
//  Created by ilkay on 22.10.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Foundation

struct TrendMovieModel: Codable {
    var page: Int!
    var total_page: Int!
    var total_results: Int!
    var results: [TrendMovieElements]!
}

struct TrendMovieElements: Codable {
    var id: Int!
    var video: Bool!
    var voteAverage: Double!
    var title: String!
    var releaseDate: String!
    var posterPath: String!
    var backdropPath: String!
    var overview: String!
    
    enum CodingKeys: String, CodingKey {
        case id
        case video
        case voteAverage = "vote_average"
        case title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case overview
    }
}
