//
//  RequestResultObjectDelegate.swift
//  airGsm-ios
//
//  Created by ilkay sever on 27.06.2019.
//  Copyright © 2019 İlkay Sever. All rights reserved.
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
