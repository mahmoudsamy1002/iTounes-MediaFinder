//
//  DescriptionViewController.swift
//  Media Finder
//
//  Created by user on 25.06.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit

class DescriptionVC: UIViewController {

    @IBOutlet weak var movieDescImage: UIImageView!
    @IBOutlet weak var movieDescName: UILabel!
    @IBOutlet weak var movieDescLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    var image = ""
    var name = ""
    var releaseYear = 0
    var rating = 0
    var genre = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    private func setupData(){
        movieDescImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "PlaceHolder"))
        movieDescName.text = "\(name)"
        movieDescLabel.text = "\(releaseYear)"
        ratingLabel.text = "\(rating)"
        genreLabel.text = "\(genre)"
    }
    
   

}
