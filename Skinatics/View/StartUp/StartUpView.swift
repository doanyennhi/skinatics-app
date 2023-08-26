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
                Image("logo-white") // logo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screenWidth)
                    .padding(.bottom, 10)
                Text("Skinatics") // app name
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.vertical, 20)
                Text("Your on-the-go skincare assistant.") // app description
                    .foregroundColor(.white)
                    .padding(.bottom, 60)
                VStack { // sign up and log in buttons
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
    
    // custom layout for StartUpView
    struct StartUpLayout: Layout {
        // determining dimensions of view
        func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout()) -> CGSize {
            guard !subviews.isEmpty else { return .zero } // checks if there are no subviews
            
            let screenSize: CGRect = UIScreen.main.bounds
            let screenWidth = screenSize.width
            let screenHeight = screenSize.height
            
            // establishing custom layout view width and height dimension is screen width and height
            return CGSize(width: screenWidth, height: screenHeight)
        }
        
        // determining position of subviews in view
        func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout()) {
            guard !subviews.isEmpty else { return } // checks if there are no subviews
            
            let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
            _ = subviewSizes.map { $0.height } // heights of each subview
            
            var y = bounds.midY // y-coordinate set at midpoint of minY and maxY
            
            // iterating through each subview
            for (index, subview) in subviews.enumerated() {
                let subviewSize = subviewSizes[index] // height of current subview
                let proposedSize = ProposedViewSize(width: screenWidth, height: subviewSize.height)
                
                if index == 0 { // logo
                    y -= subviewSize.height // set y-coordinate so that bottom border of logo sits on midY
                    subview.place(at: CGPoint(x: bounds.midX, y: y), anchor: .top, proposal: proposedSize)
                    
                }
                else { // app name, app description, buttons
                    // everything except logo is placed below one another and under mid Y
                    subview.place(at: CGPoint(x: bounds.midX, y: y), anchor: .top, proposal: proposedSize)
                }
                y += subviewSize.height // update y-coordinate
            }
                }
            }
}



