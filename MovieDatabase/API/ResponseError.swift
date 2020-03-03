//
//  ResponseError.swift
//  MovieDatabase
//
//  Created by Alihan Aktay on 10.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Foundation
class ResponseError: Codable {
    
    var code: String!
    var message: String!
    var title: String?
    
    init(code: String, message: String) {
        self.code = code
        self.message = message
    }
}
