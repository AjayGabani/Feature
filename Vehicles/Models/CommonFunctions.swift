//
//  CommonFunctions.swift
//  Vehicles
//
//  Created by Ajay Gabani on 18/11/22.
//

import Foundation
import UIKit

class CommonFunctions {
    func showAlertMessageWithNoAction(message: String, forViewController: UIViewController) {
        let strAppName = "Vehicles List"
        let alert = UIAlertController(title: strAppName, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Retry", style: .cancel, handler: { (_) in
             }))
        forViewController.present(alert, animated: true, completion: nil)
    }
    
    func setNavigationControllerApperance(title: String, forViewController: UIViewController) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        forViewController.navigationController?.navigationBar.tintColor = UIColor.white
        forViewController.navigationItem.standardAppearance = appearance
        forViewController.navigationItem.title = title
        forViewController.navigationItem.scrollEdgeAppearance = appearance
        forViewController.navigationItem.compactAppearance = appearance
    }
}
