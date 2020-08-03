//
//  File.swift
//  Media Finder
//
//  Created by user on 24.06.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import Foundation


struct Movies: Decodable {

    var title: String
    var image: String
    var rating: Double
    var releaseYear: Int
    var genre: [String]
    
    enum CodingKeys: String, CodingKey {
        case title
        case image
        case rating
        case releaseYear
        case genre
    }
}
