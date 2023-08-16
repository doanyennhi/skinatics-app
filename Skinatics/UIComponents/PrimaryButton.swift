//
//  PrimaryButton.swift
//  Skinatics
//
//  Created by Nhii on 16/8/2023.
//

import SwiftUI

struct PrimaryButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
            Button(action: action) {
                Text(title).font(.system(size: 20, weight: .bold))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .foregroundColor(.white)
            .background(Color("Secondary Green"))
            .cornerRadius(15)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(title: "Next", action: {})
    }
}
