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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
            let allHeights = subviewSizes.map { $0.height }
            
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



