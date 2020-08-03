//
//  Manager.swift
//  Media Finder
//
//  Created by user on 03.06.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import Foundation

struct UserDefultsManger {
    
    static let shared = UserDefultsManger()
    let defults = UserDefaults.standard
    
    func setUserDefults(user:User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            defults.set(encoded, forKey: "Model")
        }
    }
    
    
    func getUserDefults() -> User? {
        
        if let savedUser = defults.object(forKey: "Model") as? Data {
            let decoder = JSONDecoder()
            if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
                return loadedUser
            }
        }
        return nil
    }
}
