//
//  RequestResultObjectDelegate.swift
//  airGsm-ios
//
//  Created by Alihan Aktay on 27.06.2019.
//  Copyright © 2019 Alihan Aktay. All rights reserved.
//

import Foundation

protocol RequestResultObjectDelegate: RequestDelegate {
    associatedtype ResultObject: Codable
    
}

extension RequestResultObjectDelegate {
    
    func request(success: @escaping RequestManager.ObjectClosure<ResultObject>, failure: @escaping RequestManager.ErrorClosure) {
        RequestManager.request(self, success: success, failure: failure)
    }
    
}
