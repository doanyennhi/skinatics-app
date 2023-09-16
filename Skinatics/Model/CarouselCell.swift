//
//  CarouselCell.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 16/9/2023.
//

import SwiftUI

// CarouselCell model
struct CarouselCell: Identifiable {
    var id: UUID = .init()
    var imageName: String
    var thumbnail: UIImage?
}
