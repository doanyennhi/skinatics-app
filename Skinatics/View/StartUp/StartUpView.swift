//
//  StartUpView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 25/8/2023.
//

import SwiftUI

let screenSize: CGRect = UIScreen.main.bounds
let screenWidth = screenSize.width

struct StartUpView: View {
    var body: some View {
        NavigationStack {
            StartUpLayout {
                Image("logo-white")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screenWidth)
                    .padding(.bottom, 10)
                Text("Skinatics")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                Text("Your on-the-go skincare assistant.")
                    .foregroundColor(.white)
                    .padding(.bottom, 60)
                VStack {
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                    }
                    .buttonStyle(SecondaryButtonStyle())
                    .padding(.horizontal, 20)
                    .padding(.bottom, 5)
                    NavigationLink(destination: LoginView()) {
                        Text("Log In")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.horizontal, 20)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Dark Green"))
        }
    }
    
    struct StartUpView_Previews: PreviewProvider {
        static var previews: some View {
            StartUpView()
        }
    }
    
    struct StartUpLayout: Layout {
        func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout()) -> CGSize {
            guard !subviews.isEmpty else { return .zero }
            
            let screenSize: CGRect = UIScreen.main.bounds
            let screenWidth = screenSize.width
            let screenHeight = screenSize.height
            
            return CGSize(width: screenWidth, height: screenHeight)
        }
        
        func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout()) {
            guard !subviews.isEmpty else { return }
            
            let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
            _ = subviewSizes.map { $0.height }
            
            var y = bounds.midY
            
            for (index, subview) in subviews.enumerated() {
                let subviewSize = subviewSizes[index]
                let proposedSize = ProposedViewSize(width: screenWidth, height: subviewSize.height)
                
                if index == 0 {
                    y -= subviewSize.height
                    subview.place(at: CGPoint(x: bounds.midX, y: y), anchor: .top, proposal: proposedSize)
                    
                }
                else {
                    subview.place(at: CGPoint(x: bounds.midX, y: y), anchor: .top, proposal: proposedSize)
                }
                y += subviewSize.height
            }
                }
            }
}



