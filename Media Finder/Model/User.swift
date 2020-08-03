//
//  File.swift
//  Media Finder
//
//  Created by user on 29.05.2020.
//  Copyright © 2020 M.S. All rights reserved.
//


import UIKit



enum Gender: String, Codable {
    case male
    case female
}

struct User: Codable {
    
    var name: String?
    var email: String!
    var password: String!
    var phoneNum: String!
    var address: String!
    var gender: Gender?
    var image : Image?
    
}

struct Image: Codable{
    
   let imageData: Data?
    
    init(withImage image: UIImage) {
        self.imageData = image.jpegData(compressionQuality: 1.0) // Not PNG
    }
    
    func getImage() -> UIImage? {
        guard let imageData = self.imageData else {
            return nil
        }
        let image = UIImage(data: imageData)
        
        return image
    }
}
