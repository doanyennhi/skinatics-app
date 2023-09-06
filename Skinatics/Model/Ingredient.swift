//
//  Ingredient.swift
//  Skinatics
//
//  Created by Nhii on 6/9/2023.
//

import Foundation

struct Ingredient: Identifiable {
    var id = UUID()
    private var _name: String
    private var _description: String
    
    init(name: String, description: String) {
        self._name = name
        self._description = description
    }
    
    public var name: String {
            get {
                return self._name;
            }
        }
    
    public var description: String {
            get {
                return self._description;
            }
        }
}
