//
//  PrimaryButton.swift
//  Skinatics
//
//  Created by Nhii on 16/8/2023.
//

import SwiftUI

/// Define cancel button
struct CancelButton: View {
    
    var body: some View {
        Text("Cancel")
            .font(Font.custom("Avenir", size: 20))
            .bold()
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .foregroundColor(Color("Secondary Green"))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("Secondary Green"), lineWidth: 2)
        )
    }
}

/// Define custom style for primary button
struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .font(Font.custom("Avenir", size: 20))
            .bold()
            .frame(maxWidth: .infinity)
            .padding(.vertical, 15)
            .foregroundColor(.white)
            .background(Color("Secondary Green"))
            .cornerRadius(15)
        }
}

/// Custom style for secondary button
struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Font.custom("Avenir", size: 20))
            .bold()
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .foregroundColor(.black)
            .background(Color("Beige"))
            .cornerRadius(15)
    }
}
