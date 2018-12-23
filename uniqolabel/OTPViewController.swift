//
//  OTPViewController.swift
//  uniqolabel
//
//  Created by Choudhary, Subham on 22/12/18.
//  Copyright © 2018 Choudhary, Subham. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController {
    //MARK: OUTLETS
    @IBOutlet weak var otp0: UITextField!
    @IBOutlet weak var otp1: UITextField!
    @IBOutlet weak var otp2: UITextField!
    @IBOutlet weak var otp3: UITextField!
    
    //MARK: VARS
    var userName: String?
    var userNumber: String?
    
    //MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextfields()
    }
    
    //MARK: BUTTON ACTIONS
    @IBAction func loginAction(_ sender: Any) {
        let otp = otp0.text! + otp1.text! + otp2!.text! + otp3!.text!
        if otp == Constants.shared().OTPVC_OTP {
            if let userName = userName, let userNumber = userNumber {
                _ = KeychainWrapper.standard.set(userName, forKey: Constants.shared().userNameKey)
                _ = KeychainWrapper.standard.set(userNumber, forKey: Constants.shared().phoneNumberKey)
                
                weak var nav = (self.navigationController as! CustomNavigationController)
                nav?.setInitialViewController(viewControllerIdentifier: Constants.shared().mainScreenStoryBoardId)
            }
            
        } else {
            let alert = UIAlertController(title: "Alert !!", message: Constants.shared().OTPVC_OtpValidationText, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default) { [weak self] action in
                self?.otp0.becomeFirstResponder()
                self?.otp1.text = ""
                self?.otp2.text = ""
                self?.otp3.text = ""

                })
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    //MARK: CUSTOM FUNCTIONS
    func setupTextfields() {
        otp0.becomeFirstResponder()
        otp0.addTarget(self, action: #selector(jump(textField:)), for: .editingChanged)
        otp1.addTarget(self, action: #selector(jump(textField:)), for: .editingChanged)
        otp2.addTarget(self, action: #selector(jump(textField:)), for: .editingChanged)
        otp3.addTarget(self, action: #selector(jump(textField:)), for: .editingChanged)
    }
    
    @objc func jump(textField: UITextField) {
        
        switch textField.restorationIdentifier {
        case "0": otp0.resignFirstResponder(); otp1.becomeFirstResponder()
        case "1": otp1.resignFirstResponder(); otp2.becomeFirstResponder()
        case "2": otp2.resignFirstResponder(); otp3.becomeFirstResponder()
        default: break
        }
    }
}

extension OTPViewController: UITextFieldDelegate {
    
    //MARK: TEXTFIELD DELEGATE FUNCTIONS
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString: NSString = textField.text! as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        
        return newString.length <= maxLength
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
