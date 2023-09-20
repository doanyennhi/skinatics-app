//
//  RoutineView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 21/9/2023.
//

import SwiftUI

struct MorningView: View {
    var body: some View {
        VStack {
            Text("Skincare Routine")
                .largeTitle(multilineCenter: true)
            
            TabView {
                VStack {
                    Text("Hello world!")
                }
                    .tabItem {
                        Label("Morning", systemImage: "")
                    }
                VStack {
                    Text("Good night universe!")
                }
                    .tabItem {
                        Label("Night", systemImage: "")
                    }
            }
        }
        .modifier(ScreenModifier())
    }
}

struct MorningView_Previews: PreviewProvider {
    static var previews: some View {
        MorningView()
    }
}
