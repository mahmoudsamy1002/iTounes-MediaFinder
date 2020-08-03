//
//  MediaResponse.swift
//  Media Finder
//
//  Created by user on 14.07.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import Foundation

struct MediaResponse: Decodable {
    
    var resultCount: Int
    var results: [Media]
}
