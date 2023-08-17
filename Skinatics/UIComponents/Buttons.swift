//
//  PrimaryButton.swift
//  Skinatics
//
//  Created by Nhii on 16/8/2023.
//

import SwiftUI

struct CancelButtonLabel: View {
    
    var body: some View {
        Text("Back")
            .font(.system(size: 20, weight: .bold))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .foregroundColor(Color("Secondary Green"))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color("Secondary Green"), lineWidth: 2)
        )
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
            .font(.system(size: 20, weight: .bold))
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .foregroundColor(.white)
            .background(Color("Secondary Green"))
            .cornerRadius(15)
        }
}
