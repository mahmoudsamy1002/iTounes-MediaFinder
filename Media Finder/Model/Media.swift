//
//  Media.swift
//  Media Finder
//
//  Created by user on 14.07.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import Foundation


enum MediaType: String {
    case  movie, music, tvShow
}


struct Media: Decodable {
    var artworkUrl100:   String
    var artistName:      String?
    var trackName:       String?
    var longDescription: String?
    var previewUrl:      String
    var kind:            String?
    
    func getType() -> MediaType {
        switch self.kind {
        case "song":
            return MediaType.music
        case "feature-movie":
            return MediaType.movie
        case  "tv-episode":
            return MediaType.tvShow
        default :
            return MediaType.music
        }
    }
}
