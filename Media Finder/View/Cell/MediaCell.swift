//
//  MediaCell.swift
//  Media Finder
//
//  Created by user on 15.07.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit

class MediaCell: UITableViewCell {

   @IBOutlet weak var mediaImageView: UIImageView!
        @IBOutlet weak var mediaName: UILabel!
    @IBOutlet weak var mediaDesc: UILabel!
    
        override func awakeFromNib() {
            super.awakeFromNib()
           updateUI()
        }

        func configureCell(media: Media) {
            self.mediaImageView.sd_setImage(with: URL(string: media.artworkUrl100), placeholderImage: UIImage(named: "PlaceHolder"))
            
            if media.getType() == .music {
            self.mediaName.text = media.trackName
            self.mediaDesc.text = media.artistName
                
            } else if media.getType() == .movie {
                self.mediaName.text = media.trackName
                self.mediaDesc.text = media.longDescription
                
            } else if media.getType() == .tvShow {
                self.mediaName.text = media.artistName
                self.mediaDesc.text = media.longDescription
            }
    }
    
        func updateUI() {
            mediaImageView.layer.cornerRadius = 5.0
            mediaImageView.layer.masksToBounds = true
        }
    }
