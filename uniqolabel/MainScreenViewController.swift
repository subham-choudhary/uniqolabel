//
//  MainScreenViewController.swift
//  uniqolabel
//
//  Created by Choudhary, Subham on 22/12/18.
//  Copyright © 2018 Choudhary, Subham. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    //MARK: VARS
    var userName: String?
    var userNumber: String?
    
    //MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        loadUserCredentials() // loadUserCredentials should be called before setupNavigationBar
        setupNavigationBar()
    }
    
    //MARK: BUTTON ACTIONS
    
    @IBAction func offerAction(_ sender: Any) {
        showAlert(message: "No offers available right now. Try again later.")
    }
    
    @IBAction func aboutAction(_ sender: Any) {
        showAlert(message: "Not implemented as per requirement")
    }
    
    @IBAction func contactAction(_ sender: Any) {
        showAlert(message: "Not implemented as per requirement")
    }
    
    //MARK: CUSTOM FUNCTIONS
    func setupNavigationBar() {
        self.navigationItem.title = "\(userName!)"
        let barButtonItem = UIBarButtonItem.init(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
        barButtonItem.tintColor = UIColor.red
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
     @objc func logoutButtonTapped() {
        _ = KeychainWrapper.standard.removeAllKeys()
        weak var nav = (self.navigationController as! CustomNavigationController)
        nav?.setInitialViewController(viewControllerIdentifier: "login")
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "ALERT!", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func loadUserCredentials() {
        if let userName = KeychainWrapper.standard.string(forKey: Constants.shared().userNameKey), let userNumber = KeychainWrapper.standard.string(forKey: Constants.shared().phoneNumberKey) {
            self.userName = userName
            self.userNumber = userNumber
        } else {
            logoutButtonTapped()
        }
    }
}
