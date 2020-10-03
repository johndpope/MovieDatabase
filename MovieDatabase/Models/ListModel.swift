//
//  ListModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 26.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Foundation

struct ListModel: Codable {
    var page: Int!
    var totalPage: Int!
    var totalResults: Int!
    var results: [ListElements]!
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPage = "total_pages"
        case totalResults = "total_results"
        case results
    }
}

struct ListElements: Codable {
    var id: Int!
    var title: String!
    var video: Bool
    var posterPath: String!
    var backdropPath: String!
    var releaseDate: String!
    var voteAverage: Double!
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case video
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}

