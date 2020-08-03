//
//  SignUpVC.swift
//  Media Finder
//
//  Created by user on 29.05.2020.
//  Copyright © 2020 M.S. All rights reserved.
//

import UIKit


class SignUpVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var maleGenderLabel: UILabel!
    
    
    var user: User!
    var gender:Gender = .male
    var defultImage = UIImage(named: "profile image")
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.HideKeyboard()
        self.navigationItem.title = "Sign Up"
        imagePicker.delegate = self
        
    }
    
    
    
    // Get Image:
    @IBAction func getImageButton(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func goToSignInVC() {
        
        // creat instance of storyboard                                     // creat instance of View Controller
        let loginVc = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: VCs.logInVC)  as! LogInVC
        // for present signInVC screen :
        loginVc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(loginVc, animated: true)
    }
    
    
    
    
    // Fields Vaildation Function
    private func isVaildData() -> Bool {
        
        guard (emailTextField.text ?? "") != "" else {
            self.alert(message: "Please Enter Email", title: "Error")
            return false
        }
        guard profileImage.image != UIImage(named: "Profile Image") else {
            self.alert(message: "Please Choose Photo", title: "Error")
            return false
        }
        guard (passwordTextField.text) != "" else {
            self.alert(message: "Please Enter Password", title: "Error")
            return false
        }
        guard (phoneNumberTextField.text ?? "") != "" else {
            self.alert(message: "Please Enter Phone Number", title: "Error")
            return false
        }
        guard (addressTextField.text ?? "") != "" else {
            self.alert(message: "Please Enter The Address", title: "Error")
            return false
        }
        
        return true
    }
    
    
    
    private func isValidRegex() -> Bool {
        
        guard isValidEmail(email: self.emailTextField.text) else {
            self.alert(message: "Please Enter Valid Email", title: "Error")
            return false
        }
        guard isValidPassword(testStr: self.passwordTextField.text) else {
            self.alert(message: "Password need to be: \n at Least one Uppercase \n al Least one lowercase \n 8 Characters total", title: "Error ")
            return false
        }
        return true
    }
    
    // Gender Switch
    @IBAction func genderSwitch(_ sender: UISwitch) {
        
        if sender.isOn {
            gender = .male
        } else {
            gender = .female
        }
    }
    
    
    
    @IBAction func signUpButton(_ sender: Any) {
        
        if isVaildData() {
            if isValidRegex() {
                user = User(name: nameTextField.text, email: emailTextField.text!, password: passwordTextField.text!, phoneNum: phoneNumberTextField.text!, address: addressTextField.text! , gender: gender, image: Image(withImage: profileImage.image ?? defultImage!))
                UserDefultsManger.shared.setUserDefults(user: user)
                
                                 
                goToSignInVC()
            }
        }
    }
    
    @IBAction func getMapButton(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name: Storyboards.main, bundle: nil)
        let mapVC = storyBoard.instantiateViewController(withIdentifier: VCs.mapVC) as! MapVC
        mapVC.delegate = self
        self.navigationController?.pushViewController(mapVC, animated: true)
        
    }
}

extension SignUpVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    // UIimagePicker mithod
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.contentMode = .scaleAspectFit
            profileImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}


extension SignUpVC: MapDelegate {
    func setDelailLocationInAddress(Address: String) {
        addressTextField.text = Address
    }
}


