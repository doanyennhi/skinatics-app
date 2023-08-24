//
//  ValidationError.swift
//  Skinatics
//
//  Created by Nhii on 25/8/2023.
//

import Foundation

func isTextEmpty(text: String) -> Bool {
    return text == ""
}

func confirmPassword(pwd: String, confirmPwd: String) -> Bool {
    return pwd == confirmPwd
}
