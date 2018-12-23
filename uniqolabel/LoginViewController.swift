//
//  LoginViewController.swift
//  uniqolabel
//
//  Created by Choudhary, Subham on 22/12/18.
//  Copyright © 2018 Choudhary, Subham. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController{
    
    //MARK: OUTLETS
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    //MARK: VIEW LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        addDoneButtonOnNumPad()
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(true)
    //        phoneNumberTextField.text = ""
    //        nameTextField.text = ""
    //    }
    
    //MARK: BUTTON ACTIONS
    @IBAction func OTPButton(_ sender: Any) {
        if phoneNumberTextField.text?.count == 10 && (nameTextField.text?.count)! > 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: Constants.shared().otpScreenStoryBoardId) as! OTPViewController
            vc.userName = nameTextField.text
            vc.userNumber = phoneNumberTextField.text
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else {
            var alertText = ""
            nameTextField.text = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            if nameTextField.text?.count == 0 {
                alertText = Constants.shared().LoginScreenVC_nameValidationtext
            }
            if (phoneNumberTextField.text?.count)! < 10 {
                if alertText.count == 0 {
                    alertText = Constants.shared().LoginScreenVC_phoneValidationtext
                } else {
                    alertText += " &" + Constants.shared().LoginScreenVC_phoneValidationtext
                }
            }
            let finaAlertText = Constants.shared().LoginScreenVC_initialValidationText + alertText
            let alert = UIAlertController(title: "Alert !!", message: finaAlertText, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: CUSTOM FUNCTIONS
    func addDoneButtonOnNumPad() {
        let doneToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneButtonAction))
        var items = [UIBarButtonItem]()
        
        items.append(flexibleSpace)
        items.append(done)
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        phoneNumberTextField.inputAccessoryView = doneToolbar
        nameTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        phoneNumberTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    //MARK: TEXTFIELD DELEGATE FUNCTIONS
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.restorationIdentifier == Constants.shared().LoginScreenVC_phoneTextFieldId {
            let maxLength = 10
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        } else {
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneNumberTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
    }
}


