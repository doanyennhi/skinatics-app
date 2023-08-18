//
//  SkinConditionView.swift
//  Skinatics
//
//  Created by Nhii on 18/8/2023.
//

import SwiftUI

var conditions: [String] = ["Acne", "Rosacea", "Eczema", "Rash", "Melasma", "Hives", "Psoriasis", "Dermatitis"]

struct SkinConditionView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScreenTitle(title: "Any skin conditions?")
                    .padding(.bottom, 5)
                
                OptionGrid(options: conditions)
                Button("Submit", action: {})
                    .buttonStyle(PrimaryButtonStyle())
            }
            
            .padding(.horizontal, 30)
            .font(Font.custom("Avenir", size: 18))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Floral White"))
        }
    }
}

struct SkinConditionView_Previews: PreviewProvider {
    static var previews: some View {
        SkinConditionView()
    }
}
