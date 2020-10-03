//
//  RequestDelegate.swift
//  airGsm-ios
//
//  Created by ilkay sever on 27.06.2019.
//  Copyright © 2019 İlkay Sever. All rights reserved.
//

import Alamofire

protocol RequestDelegate {
    
    var path: String {get}
    var method: HTTPMethod {get}
    var parameters: Parameters? {get set}
    var enconding: ParameterEncoding? {get set}
    
}
