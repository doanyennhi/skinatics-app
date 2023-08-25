//
//  ValidationError.swift
//  Skinatics
//
//  Created by Nhii on 25/8/2023.
//

import Foundation

// TODO: add comments
func isTextEmpty(text: String) -> Bool {
    return text == ""
}

func confirmPassword(pwd: String, confirmPwd: String) -> Bool {
    return pwd == confirmPwd
}

func validateEmail(email: String) -> Bool {
    let emailValidator = try? NSDataDetector(
      types: NSTextCheckingResult.CheckingType.link.rawValue
    )

    let rangeOfValidatedEmail = NSRange(
        email.startIndex..<email.endIndex,
      in: email
    )

    let matches = emailValidator?.matches(
      in: email,
      options: [],
      range: rangeOfValidatedEmail
    )
    
    guard matches?.count == 1 else {
      return false
    }
    let firstMatch = matches?.first
    guard firstMatch?.range == rangeOfValidatedEmail else {
      return false
    }

    guard firstMatch?.url?.scheme == "mailto" else {
      return false
    }
    return true
}

