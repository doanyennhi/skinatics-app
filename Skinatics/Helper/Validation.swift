//
//  ValidationError.swift
//  Skinatics
//
//  Created by Nhii on 25/8/2023.
//

import Foundation

/// Validate user's name
/// @name: Name of user entered
/// return true if valid name, false otherwise
func isNameValid(name: String) -> Bool {
    return !name.isEmpty && name.count > 1
}

