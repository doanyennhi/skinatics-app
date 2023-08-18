//
//  SkinIssuesView.swift
//  Skinatics
//
//  Created by Nhii on 17/8/2023.
//

import SwiftUI

var skinIssues: [String] = ["Blackheads", "Dark spots", "Enlarged pores", "Sun protection", "Under-eye circles", "Signs of Aging", "Dullness", "Fine lines", "Acne", "Acne scars", "Redness"]


struct SkinIssuesView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                ScreenTitle(title: "What do you need help with?")
                    .padding(.bottom, 5)
                
                Text("Choose one or more skin concerns you want to treat")
                    .foregroundColor(Color("Secondary Green"))
                    .padding(.bottom, 20)
                
                OptionGrid(options: skinIssues)
    
                NavigationLink(destination: SkinConditionView()) {
                   Text("Next")
                }
                .buttonStyle(PrimaryButtonStyle())
            }
            
            .padding(.horizontal, 30)
            .font(Font.custom("Avenir", size: 18))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Floral White"))
        }
    }
}


struct SkinIssuesView_Previews: PreviewProvider {
    static var previews: some View {
        SkinIssuesView()
    }
}
