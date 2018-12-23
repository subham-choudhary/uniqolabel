//
//  Constants.swift
//  uniqolabel
//
//  Created by Choudhary, Subham on 22/12/18.
//  Copyright © 2018 Choudhary, Subham. All rights reserved.
//

import Foundation

//Singleton Class
class Constants {
    
    private static let constants = Constants()
    private init(){}
    
    class func shared() -> Constants {
        return constants
    }
    // Common constants
    let userNameKey = "USERNAMEKEY"
    let phoneNumberKey = "PHONENUMBERKEY"
    let loginScreenStoryBoardId = "login"
    let otpScreenStoryBoardId = "otp"
    let mainScreenStoryBoardId = "main"
    let augmentedVCStoryBoardId = "augmented"
    let notImplementedString = "Not implemented as per requirement"
    
    //LoginScreenVC
    let LoginScreenVC_initialValidationText = "Please enter a valid"
    let LoginScreenVC_nameValidationtext = " Name"
    let LoginScreenVC_phoneValidationtext = " Phone Number"
    let LoginScreenVC_phoneTextFieldId = "num"
    
    //OTPVC
    let OTPVC_OTP = "0000"
    let OTPVC_OtpValidationText = "Enter a valid OTP"
    
    //ProductVC
    let ProductVc_Title = "Products"
    let ProductVC_CellID = "cellId"
}
