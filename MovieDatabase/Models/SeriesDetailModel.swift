//
//  SeriesDetailModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 10.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Foundation

struct SeriesDetailModel: Codable {
    
    var id: Int!
    var title: String!
    var description: String!
    var posterPath: String!
    var backdropPath: String!
    var relaeseDate: String
    var voteAverage: Double!
    var numberOfEpisodes: Int!
    var numberOfSeasons: Int!
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title = "original_name"
        case description = "overview"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case relaeseDate = "first_air_date"
        case numberOfSeasons = "number_of_seasons"
        case numberOfEpisodes = "number_of_episodes"
    }

}
