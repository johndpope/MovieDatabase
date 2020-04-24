//
//  GenreModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 4.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Foundation

// MARK: - Genre
struct GenreModel: Codable {
    let genres: [GenreElement]
}

// MARK: - GenreElement
struct GenreElement: Codable {
    let id: Int
    let name: String
}
