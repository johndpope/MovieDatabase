//
//  SessionModel.swift
//  MovieDatabase
//
//  Created by ilkay sever on 24.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Foundation

struct SessionModel: Codable {
    var sessionId: String!
    
    private enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
    }
}
