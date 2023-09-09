//
//  Review.swift
//  Skinatics
//
//  Created by Nhii on 9/9/2023.
//

import Foundation

struct Review: Identifiable {
    var id = UUID()
    var reviewer: String
    var rating: Double
    var comment: String
}
