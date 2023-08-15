//
//  ContentView.swift
//  Skinatics
//
//  Created by Nhii on 14/8/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
            Text("Hello, world!")
        }
        .padding()
        .foregroundColor(Color("Light Green"))
        .font(Font.custom("Avenir", size: 18))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("Floral White"))
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
