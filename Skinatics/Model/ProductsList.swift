//
//  Product.swift
//  Skinatics
//
//  Created by Nhii on 27/8/2023.
//

import Foundation

/// Define models when calling API to fetch list of all products
struct ProductsList: Codable {
    var data: [Product]
}

struct Product: Identifiable, Codable {
    var id: String
    var attributes: ProductAttributes
}

struct ProductAttributes: Codable {
    
    var name: String
    var rating: Double
    var description: String
    var ingredients: String
    var benefits: String
    var imageUrls: [String]
    var brand: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case rating
        case description
        case ingredients
        case benefits
        case imageUrls = "image-urls"
        case brand = "brand-name"
    }
}
