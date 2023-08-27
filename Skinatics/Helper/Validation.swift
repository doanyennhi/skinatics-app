//
//  ValidationError.swift
//  Skinatics
//
//  Created by Nhii on 25/8/2023.
//

import Foundation

/// Validate if password and confirm password strings are identical
/// @pwd: password
/// @confirmPwd: confirm password
/// return true if  identical, false otherwise
func confirmPassword(pwd: String, confirmPwd: String) -> Bool {
    return pwd == confirmPwd
}

/// Validate email address
/// @email: Email address string
/// return true if valid email, false otherwise
func validateEmail(email: String) -> Bool {
    let emailValidator = try? NSDataDetector(
      types: NSTextCheckingResult.CheckingType.link.rawValue
    )

    // define range of the email string
    let rangeOfValidatedEmail = NSRange(
        email.startIndex..<email.endIndex,
      in: email
    )

    let matches = emailValidator?.matches(
      in: email,
      options: [],
      range: rangeOfValidatedEmail
    )
    
    // Ensure only 1 match is returned
    guard matches?.count == 1 else {
      return false
    }
    let firstMatch = matches?.first
    guard firstMatch?.range == rangeOfValidatedEmail else {
      return false
    }

    // Check if string is recognized as actual email address
    guard firstMatch?.url?.scheme == "mailto" else {
      return false
    }
    return true
}

