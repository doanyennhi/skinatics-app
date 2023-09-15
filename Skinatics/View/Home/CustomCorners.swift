//
//  CustomCorners.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 15/9/2023.
//

import SwiftUI

struct CustomCorners: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return .init(path.cgPath)
    }
}
