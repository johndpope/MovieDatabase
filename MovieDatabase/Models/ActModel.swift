//
//  ActModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 27.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Foundation

struct ActModel: Codable {
    var act: [ActElements]!
}

struct ActElements: Codable {
    var birthday: String!
    var name: String!
    var gender: GenderType!
    var biography: String!
    var placeOfBirth: String!
    var profilePath: String!
    
    enum GenderType: Int, Codable {
        case female = 1
        case male = 2
    }
    
    enum CodingKeys: String, CodingKey {
        case birthday
        case name
        case gender
        case biography
        case placeOfBirth = "place_of_birth"
        case profilePath = "profile_path"
    }
}
