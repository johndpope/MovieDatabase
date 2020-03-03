//
//  FavoriteMovieModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 26.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Foundation

struct FavoriteMovieModel: Codable {
    var page: Int!
    var totalPage: Int!
    var totalResults: Int!
    var results: [FavoriteMovieResponse]!
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPage = "total_pages"
        case totalResults = "total_results"
        case results
    }
}

struct FavoriteMovieResponse: Codable {
    var id: Int!
    var title: String!
    var video: Bool
    var posterPath: String!
    var backdropPath: String!
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case video
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

