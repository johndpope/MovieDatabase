//
//  MovieModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 10.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Foundation

struct MovieModel: Codable {
    var page: Int?
    var total_results: Int!
    var total_pages: Int?
    var results: [MovieElements]!
}

struct MovieElements: Codable {
    var id: Int!
    var title: String!
    var video: Bool!
    var popularity: Double!
    var description: String!
    var posterPath: String!
    var voteAverage: Double!
    var backdropPath: String!
    var releaseDate: String!
    
    private enum CodingKeys: String, CodingKey{        
        case id
        case title
        case popularity
        case video
        case description = "overview"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        
    }
}
