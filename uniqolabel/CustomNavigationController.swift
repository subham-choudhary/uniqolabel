//
//  customNavigationController.swift
//  uniqolabel
//
//  Created by Choudhary, Subham on 22/12/18.
//  Copyright © 2018 Choudhary, Subham. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let userName = KeychainWrapper.standard.string(forKey: Constants.shared().userNameKey), let userNumber = KeychainWrapper.standard.string(forKey: Constants.shared().phoneNumberKey) {
            if let initialVC = self.storyboard?.instantiateViewController(withIdentifier: "main") as? MainScreenViewController {
                initialVC.userName = userName
                initialVC.userNumber = userNumber
                self.pushViewController(initialVC, animated: true)
            }
        } else {
            if let initialVC = self.storyboard?.instantiateViewController(withIdentifier: "login") {
                self.pushViewController(initialVC, animated: true)
            }
        }
        
    }
    
    
    func setInitialViewController(viewControllerIdentifier: String) {
        self.viewControllers.removeAll()
        if let initialVC = self.storyboard?.instantiateViewController(withIdentifier: viewControllerIdentifier) {
            self.pushViewController(initialVC, animated: true)
        }
    }
}
