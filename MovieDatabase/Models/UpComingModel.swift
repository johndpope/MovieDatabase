//
//  UpComingModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 25.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Foundation

struct UpComingModel: Codable {
    var page: Int!
    var totalPage: Int!
    var results: [UpComingResponse]!
    
    
    enum CodingKesy: String, CodingKey {
        case page
        case results
        case totalPage = "total_pages"
    }
}

struct UpComingResponse: Codable{
    var id: Int!
    var title: String!
    var posterPath: String!
    var backdropPath: String!
    var description: String!
    var voteAverage: Double!
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case description = "overview"
        case voteAverage = "vote_average"
    }
    
}

