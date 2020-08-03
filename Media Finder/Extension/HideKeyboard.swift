//
//  HideKeyboard.swift
//  Media Finder
//
//  Created by user on 28.06.2020.
//  Copyright © 2020 M.S. All rights reserved.
//


import UIKit

extension UIViewController {
    
    func HideKeyboard() {
        
        let Tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        
        view.addGestureRecognizer(Tap)
    }
    
    
     @objc func DismissKeyboard() {
          
          view.endEditing(true)
      }
}
