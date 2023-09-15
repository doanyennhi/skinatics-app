//
//  Cell.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 15/9/2023.
//

import SwiftUI

struct Cell: Identifiable {
    var id = UUID().uuidString
    var cellTitle: String
    var cellImage: String
    var subtitle: String
    var description: String
}

var sampleCells: [Cell] = [
    Cell(cellTitle: "Product of the Day", cellImage: "cerave-hydrating-foaming-oil-cleanser", subtitle: "", description: "Developed with dermatologists, CeraVe Hydrating Foaming Oil Cleanser gently cleanses and replenishes the skin’s moisture levels for all day hydration. The ultra-mild foaming texture provides a gentle approach to cleansing, without drying out the skin. The transformation of oil to foam when lathered on the skin effectively removes excess dirt and impurities, without stripping the skin moisture barrier, an ideal squalane cleanser formula for those with dry or sensitive skin."),
    Cell(cellTitle: "Reminder", cellImage: "cerave-hydrating-foaming-oil-cleanser", subtitle: "", description: ""),
    Cell(cellTitle: "Other 1", cellImage: "cerave-hydrating-foaming-oil-cleanser", subtitle: "", description: ""),
    Cell(cellTitle: "Other 2", cellImage: "cerave-hydrating-foaming-oil-cleanser", subtitle: "", description: ""),
]
