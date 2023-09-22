//
//  NoResultView.swift
//  Skinatics
//
//  Created by Nhii on 22/9/2023.
//

import SwiftUI

struct NoResultView: View {
    var text: String
    
    var body: some View {
        VStack {
            Image("no-result")
                .resizable()
                .scaledToFit()
            Text(text)
                .padding(.vertical)
                .multilineTextAlignment(.center)
        }
    }
}

struct NoResultView_Previews: PreviewProvider {
    static var previews: some View {
        NoResultView(text: "Sorry, we cannot find the product you are looking for!")
    }
}
