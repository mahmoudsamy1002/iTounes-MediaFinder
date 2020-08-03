//  MoviesViewController.swift
//  Media Finder
//
//  Created by user on 24.06.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit
import SDWebImage
import MBProgressHUD
import AVKit


class MediaVC: UIViewController {
    
    @IBOutlet weak var mediaSearchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    
    var mediaArr = [Media]()
    var mediaKind: MediaType = .music
    var tabBarCnt: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isUserLoggedIn)
        tableView.register(UINib.init(nibName: Cells.mediaCell, bundle: nil), forCellReuseIdentifier: Cells.mediaCell)
        tableView.dataSource = self
        tableView.delegate = self
        setupNavBar()
     
    }
    
    @objc func profileTapped() {
        goToProfileVc()
    }

    
    func setupNavBar() {
        mediaSearchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "My Media"
        self.navigationItem.setHidesBackButton(true, animated: false)
       
        let rightNaviButton = UIBarButtonItem(title: "Profile", style: UIBarButtonItem.Style.plain, target: self, action: #selector(profileTapped))
        self.navigationItem.rightBarButtonItem = rightNaviButton
    }
    

    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            mediaKind = .music
            fetchMovies(criteria: mediaSearchBar.text!, mediaType: .music)
        case 1:
            mediaKind = .movie
            fetchMovies(criteria: mediaSearchBar.text!, mediaType: .movie)
        case 2:
            mediaKind = .tvShow
            fetchMovies(criteria: mediaSearchBar.text!, mediaType: .tvShow)
        default:
            mediaKind = .movie
        }
    }
    
    
    
    private func isValid() -> Bool {
        guard let searchItem = mediaSearchBar.text, !searchItem.isEmpty else { alert(message: "Not Found"); return false }
        
        return true
    }
    
    
    
    
    private func fetchMovies(criteria: String, mediaType: MediaType) {
        APIManager.loadITunesMedia(criteria: criteria, mediaType: mediaType) { (error, mediaArr) in
            if let error = error {
                print(error.localizedDescription)
            } else if let media = mediaArr {
                self.mediaArr = media
                self.tableView.reloadData()
            }
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    
//    func goToDescriptionVC() {
//        let descriptionVC = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: VCs.descriptionVC) as! DescriptionVC
//        self.navigationController?.pushViewController(descriptionVC, animated: true)
//    }
//    
    
    
    func goToProfileVc() {
        
        let profileVC = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: VCs.profileVC) as! ProfileVC
        self.navigationController?.pushViewController(profileVC, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func mediaPlayer(mediaURL: String) {
        let videoURL = URL(string: mediaURL)
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }

}


extension MediaVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.mediaCell, for: indexPath) as? MediaCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(media: mediaArr[indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let ourMedia = mediaArr[indexPath.row]
        mediaPlayer(mediaURL: ourMedia.previewUrl)
        
        
        //        let descriptionVC = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: VCs.descriptionVC) as! DescriptionVC
        //
        
        //        descriptionVC.name = moviesArr[indexPath.row].title
        //        descriptionVC.image = moviesArr[indexPath.row].image
        //        descriptionVC.releaseYear = moviesArr[indexPath.row].releaseYear
        //        descriptionVC.rating = Int(moviesArr[indexPath.row].rating)
        //        descriptionVC.genre = moviesArr[indexPath.row].genre
        //
        //        self.navigationController?.pushViewController(descriptionVC, animated: true)
        
    }
}

extension MediaVC: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        print("\(String(describing: mediaSearchBar.text))")
        
        if isValid() {
            fetchMovies(criteria: mediaSearchBar.text!, mediaType: mediaKind)
        } else {
            alert(message: "Search is Empty")
        }
    }
}
