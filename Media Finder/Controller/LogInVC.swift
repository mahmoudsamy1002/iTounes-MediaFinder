//
//  LogInViewController.swift
//  Media Finder
//
//  Created by user on 29.05.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit

class LogInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
 
    var user = UserDefultsManger.shared.getUserDefults()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInData()
        
        
        UserDefaults.standard.set(false, forKey: UserDefaultsKeys.isUserLoggedIn)
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    
    private func logInData() {
        
        emailTextField.text = user?.email
        passwordTextField.text = user?.password
        
    }
    
    
    
    private func isVaildData() -> Bool {
        guard emailTextField.text ?? "" != "" else {
            self.alert(message: "Please Enter Email", title: "Error")
            return false
        }
        guard passwordTextField.text ?? "" != "" else {
            self.alert(message: "Please Enter Password", title: "Error")
            return false
        }
        return true
    }
    
    
    private func isUserDataVaild() -> Bool {
        guard emailTextField.text == user?.email, passwordTextField.text == user?.password else {
            self.alert(message: "Invaild Email Or Password", title: "Error")
            return false
        }
        return true
    }
    
    
    
    private func goToMoviesViewController () {
        
        let profileVC = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: VCs.moviesVC) as! MediaVC
        self.navigationController?.pushViewController(profileVC, animated: true)
        
    }
    
    
    
    private func goToSignUpVC () {
        let signUp = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: VCs.signUpVC) as! SignUpVC
        self.navigationController?.pushViewController(signUp, animated: true)
        signUp.modalPresentationStyle = .fullScreen
    }
    
    
    @IBAction func logInPressed(_ sender: Any) {
        if isVaildData() {
            if isValidEmail(email: emailTextField.text) {
                if isUserDataVaild() {
                    goToMoviesViewController()
                   
                }
            }
        }
    }

    
    
    
    @IBAction func signUpButton(_ sender: Any) {
        
        goToSignUpVC()
        
    }
}

