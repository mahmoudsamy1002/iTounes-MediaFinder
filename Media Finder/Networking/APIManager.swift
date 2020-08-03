//
//  APIManager.swift
//  Media Finder
//
//  Created by user on 07.07.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import Foundation
import Alamofire

class APIManager: NSObject {
    
    class func loadITunesMedia(criteria: String, mediaType: MediaType, completion: @escaping ( _ error: Error?, _ media: [Media]?) -> Void) {
        
        Alamofire.request(URLs.iTunesSearch, method: HTTPMethod.get, parameters: [paramters.term: criteria, paramters.media: mediaType], encoding: URLEncoding.default, headers: nil).response {
            response in
            guard response.error == nil else {
                print(response.error!)
                completion(response.error, nil)
                return
            }
            guard let data = response.data else {
                print("didn't get data from API")
                return
            }
            do {
                let decoder = JSONDecoder()
                let mediaArr = try decoder.decode(MediaResponse.self, from: data).results
                completion(nil, mediaArr)
            } catch let error {
                print(error)
            }
        }
    }
}
