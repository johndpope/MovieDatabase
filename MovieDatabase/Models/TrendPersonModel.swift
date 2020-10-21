//
//  TrendPersonModel.swift
//  MovieDatabase
//
//  Created by ilkay on 21.10.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Foundation

struct TrendPersonModel: Codable {
    var page: Int!
    var total_pages: Int!
    var total_results: Int!
    var results: [TrendPersonElements]!
}

struct TrendPersonElements: Codable {
    var adult: Bool!
    var gender: Int!
    var name: String!
    var id: Int!
    var profilePath: String!
    var mediaType: String!
    var knownFor: [KnowFor]!
    
    enum CodingKeys: String, CodingKey {
        case adult
        case gender
        case name
        case id
        case profilePath = "profile_path"
        case mediaType = "media_type"
        case knownFor
    }
}

struct KnowFor: Codable {
    var adult: Bool!
    var backdropPath: String!
    //var genreId: []!
    var id: Int!
    var overview: String!
    var posterPath: String!
    var releaseDate: String!
    var title: String!
    var video: Bool!
    var voteAverage: Double!
    var mediaType: String!
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        //case genreId
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case mediaType = "media_type"
    }
    
}
