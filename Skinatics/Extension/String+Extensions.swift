//
//  String+Extensions.swift
//  Skinatics
//
//  Created by Nhii on 22/9/2023.
//

import Foundation

extension String {
    func stripHTML() -> String {
        return self.replacing(/<[^>]+>/, with: "")
    }
}
