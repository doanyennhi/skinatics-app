//
//  ResultsView.swift
//  Skinatics
//
//  Created by Nhii on 6/9/2023.
//

import SwiftUI

struct ResultsView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ScreenTitle(title: "Today's Results")
                Text("What's this?")
                    .foregroundColor(Color("Grey"))
                    .font(Font.custom("Avenir", size: 16))
                    .underline()
                
                VStack {
                    HStack {
                        Text("Overall")
                        Spacer()
                        Text("74")
                            .font(Font.custom("Avenir", size: 20))
                    }
                    .foregroundColor(Color("White"))
                    .bold()
                    .padding()
                    .background(Color("Dark Green"))
                    .clipShape(Capsule())
                    .padding(.vertical, 20)
                }
                
                Text("Analysis")
                    .foregroundColor(Color("Dark Green"))
                    .font(Font.custom("Avenir", size: 22))
                    .bold()
                    .padding(.vertical, 10)
                
                VStack(alignment: .leading, spacing: 25) {
                    ResultSection(heading: "Hydration", content: "Your skin appears to be a little less hydrated. Look for products with hyaluronic acid to lock in moisture.")
                    
                    ResultSection(heading: "Radiance", content: "We’re not seeing a change here yet. We recommend getting some good sleep every night and finding a product with vitamin C to help even out uneven skin tone.")
                    
                    ResultSection(heading: "Texture", content: "Your skin texture is getting better, however we still have to work on some texture like acne scars.")
                    
                    ResultSection(heading: "Lines", content: "We can see that there are no visible lines on your skin, great job preventing lines.")
                }
                .padding(.bottom, 30)
                
                NavigationLink(destination: CameraView()) {
                    Text("Exit")
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.top, 30)
            }
            .padding(.top, 1)
            .modifier(ScreenModifier())
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView()
    }
}
