//
//  ProfileViewController.swift
//  Media Finder
//
//  Created by user on 29.05.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var user = UserDefultsManger.shared.getUserDefults()
    var image: Image!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let rightNaviButton = UIBarButtonItem(title: "Sign Out", style: UIBarButtonItem.Style.plain, target: self, action: #selector(signOutTapped))
        self.navigationItem.rightBarButtonItem = rightNaviButton
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        setUserData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    @objc func signOutTapped() {
        goToSignOutVC()
        UserDefaults.standard.set(false, forKey: UserDefaultsKeys.isUserLoggedIn)
    }
    
    
   

    private func setUserData() {

        profileImage.image = user?.image!.getImage()
        nameLabel.text = user?.name
        emailLabel.text = user?.email
        phoneNumberLabel.text = user?.phoneNum
        genderLabel.text = (user?.gender).map { $0.rawValue }
        addressLabel.text = user?.address

    }
    
    private func goToSignOutVC() {
        let storyBoard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let signIn = storyBoard.instantiateViewController(withIdentifier: VCs.logInVC ) as! LogInVC
        signIn.modalPresentationStyle = .fullScreen // not need in push
        self.navigationController?.pushViewController(signIn, animated: true)
    }
    

}
