//
//  GenreModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 4.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Foundation

struct GenreModel: Codable {
    let genres: [GenreElement]
}

struct GenreElement: Codable {
    let id: Int
    let name: String
}
