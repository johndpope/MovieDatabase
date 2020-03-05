//
//  SingletonUser.swift
//  MovieDatabase
//
//  Created by Erhan Acisu on 26.02.2020.
//  Copyright © 2020 Alihan Aktay. All rights reserved.
//

import Foundation
import MSAUserDefaults

class Account: Codable{
    var token: TokenModel!
    var session: SessionModel!
    var user: UserModel!
    
    static let current = Account()
    
    init() {
        self.session = self.currentAuth()
    }
    func login() {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        do{
            let jsonData = try jsonEncoder.encode(self.session)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                DefaultsKey.auth.value = jsonString
                print(jsonString)
            }
        }
        catch let error{
            print(error)
        }
    }
    func saveChanges() {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        do{
            let jsonData = try jsonEncoder.encode(self.session)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                DefaultsKey.auth.value = jsonString
                print(jsonString)
            }
        }
        catch let error{
            print(error)
        }
    }
    class func isGuest() -> Bool {
        return !DefaultsKey.auth.has
    }
    private func currentAuth() -> SessionModel? {
        if let authJSONString = DefaultsKey.auth.value {
            let jsonDecoder = JSONDecoder()
            let data = authJSONString.data(using: .utf8)!
            do {
                let account = try jsonDecoder.decode(SessionModel.self, from: data)
                return account
            }
            catch let error{
                print(error)
                return nil
            }
        }
        return nil
    }
    func logOut() {
        DefaultsKey.auth.remove()
    }
    
}
