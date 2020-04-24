//
//  LatestModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 11.02.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Foundation


struct LatestModel: Codable {    
    var id: Int!
    var backdropPath: String!
    var posterPath: String!
    var title: String!
    var releaseDate: String!
    
    private enum CodingKeys: String, CodingKey{
        
        case id
        case title
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        
    }

}
