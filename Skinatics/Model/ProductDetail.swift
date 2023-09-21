//
//  ProductDetail.swift
//  Skinatics
//
//  Created by Nhii on 21/9/2023.
//

import Foundation

// model for when calling API to fetch 1 product from ID
struct ProductDetail: Codable {
    var data: Product
}

// Model of result when calling API to search product by barcode
struct ProductSearch: Codable {
    var data: ProductResult
}

struct ProductResult: Codable, Identifiable {
    var id: String
    var attributes: Attributes
}

struct Attributes: Codable {
    var productId: String
    
    private enum CodingKeys: String, CodingKey {
        case productId = "product-id"
    }
}
