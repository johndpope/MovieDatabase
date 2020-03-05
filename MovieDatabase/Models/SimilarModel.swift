//
//  SimilarModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 13.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Foundation

struct SimilarModel: Codable {
    var page: Int!
    var results: [Similarelements]!
    
}

struct Similarelements: Codable {
    var id: Int!
    var title: String!
    var posterPath: String!
    var backdropPath: String!
    
    enum CodingKeys: String, CodingKey{
        case id
        case title
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
    
}



