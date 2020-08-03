//
//  Constants.swift
//  Media Finder
//
//  Created by user on 24.06.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import Foundation

struct Storyboards {
    static let main = "Main"
}

struct VCs  {
    
    static let logInVC = "LogInVC"
    static let profileVC = "ProfileVC"
    static let signUpVC = "SignUpVC"
    static let mapVC = "MapVC"
    static let moviesVC = "MoviesVC"
    static let descriptionVC = "DescriptionVC"
}

struct Cells {
    static let mediaCell = "MoviesCell"
}

struct UserDefaultsKeys {
    static let isUserLoggedIn = "isUserLoggedIn"
}

struct URLs {
    static let base = "https://api.androidhive.info/json/movies.json"
    static let iTunesSearch = "https://itunes.apple.com/search?"
}

struct paramters {
    static let term =  "term"
    static let media = "media"
}

//struct UserDB {
//    static var Shared = UserDataBase.Shared()
//}
