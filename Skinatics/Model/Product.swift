//
//  Product.swift
//  Skinatics
//
//  Created by Nhii on 27/8/2023.
//

import Foundation

/// Define model for Product
struct Product: Identifiable {
    var id = UUID()
    var image: String
    var brand: String
    var product: String
    var rating: Float
    var desc: String
    var ingredients: String
}
