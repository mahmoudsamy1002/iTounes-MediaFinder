//
//  MoviesCell.swift
//  Media Finder
//
//  Created by user on 24.06.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit

class MediaCell: UITableViewCell {
    
    
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       updateUI()
    }

    func configureCell(media: Media) {
        
        
        self.mediaImageView.sd_setImage(with: URL(string: media.artworkUrl100), placeholderImage: UIImage(named: "PlaceHolder"))
        self.movieName.text = media.trackName
               
    }
    
    func updateUI() {
        
        mediaImageView.layer.cornerRadius = 5.0
        mediaImageView.layer.masksToBounds = true
        
    }
    
}
