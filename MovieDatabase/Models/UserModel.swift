//
//  UserModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 26.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Foundation

struct UserModel: Codable {
    var avatar: Avatar
    var id: Int
    var username: String

}

// MARK: - Avatar
struct Avatar: Codable {
    var gravatar: Gravatar
}

// MARK: - Gravatar
struct Gravatar: Codable {
    var hash: String
}
