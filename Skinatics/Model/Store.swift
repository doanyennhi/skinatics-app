//
//  Store.swift
//  Skinatics
//
//  Created by Nhii on 7/9/2023.
//

import Foundation

struct Store: Identifiable {
    var id = UUID()
    private var _image: String
    private var _name: String
    private var _address: String
    
    init(image: String, name: String, address: String) {
        self._image = image
        self._name = name
        self._address = address
    }
    
    public var image: String {
            get {
                return self._image;
            }
        }
    
    public var name: String {
            get {
                return self._name;
            }
        }
    
    public var address: String {
            get {
                return self._address;
            }
        }
}
