//
//  ViewController.swift
//  Media Finder
//
//  Created by user on 29.05.2020.
//  Copyright © 2020 M.S. All rights reserved.
//
import Foundation
import UIKit

extension UIViewController {
  func alert(message: String, title: String = "") {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(OKAction)
    self.present(alertController, animated: true, completion: nil)
  }
}
