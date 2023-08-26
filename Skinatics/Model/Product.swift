//
//  Product.swift
//  Skinatics
//
//  Created by Nhii on 27/8/2023.
//

import Foundation

/// Define model for Product
struct Product: Identifiable {
    var id = UUID().uuidString
    var image: String
    var brand: String
    var product: String
}
