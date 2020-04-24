//
//  VideoModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 6.03.2020.
//  Copyright © 2020 İlkay Sever. All rights reserved.
//

import Foundation

struct VideoModel: Codable {
    var id: Int!
    var results: [VideoElements]!
}

struct VideoElements: Codable{
    var id: String!
    var key: String?
    var site: SourceType?
    
}

enum SourceType: String, Codable {
    case youtube = "YouTube"
    case vimeo = "vimeo"
    
    var baseURL: String {
        switch self {
        case .vimeo: return ""
        case .youtube: return "https://www.youtube.com/watch?v="
        }
    }
}


