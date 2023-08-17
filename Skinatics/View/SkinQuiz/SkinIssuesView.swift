//
//  SkinIssuesView.swift
//  Skinatics
//
//  Created by Nhii on 17/8/2023.
//

import SwiftUI

var skinIssues: [String] = ["Blackheads", "Dark spots", "Enlarged pores", "Sun protection", "Under-eye circles", "Signs of Aging"]

struct SkinIssuesView: View {
    @State var selectedIssues = Set<String>()
    
    var body: some View {
        VStack {
            ScreenTitle(title: "What do you need help with?")
            
            List(skinIssues, id: \.self) { issue in
                Checklist(content: issue, isSelected: selectedIssues.contains(issue)) {
                    if (selectedIssues.contains(issue)) {
                        selectedIssues.remove(issue)
                    } else {
                        selectedIssues.insert(issue)
                    }
                    print(selectedIssues)
                }
                .listRowBackground(Color("Floral White"))
            }
            .listStyle(.plain)
           
            
            Button("Next", action: {})
                .buttonStyle(PrimaryButtonStyle())
            
            Button(action: {
                    print("sign up bin tapped")
                }) {
                    CancelButtonLabel()
                }
        }
        .padding(.horizontal, 30)
        .font(Font.custom("Avenir", size: 18))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Floral White"))
                .foregroundColor(.black)
        
        
    }
}

struct SkinIssuesView_Previews: PreviewProvider {
    static var previews: some View {
        SkinIssuesView()
    }
}
