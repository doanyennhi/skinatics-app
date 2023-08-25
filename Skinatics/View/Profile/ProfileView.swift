//
//  ProfileView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 25/8/2023.
//

import SwiftUI

var profileOptions: [String] = ["Notifications", "Settings", "FAQs", "Get help", "Feedback", "Privacy and terms"]

struct ProfileView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Jane Doe")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color("Dark Green"))
                    
                    NavigationLink(destination: EditProfileView()) {
                        Text("View and edit profile")
                            .foregroundColor(Color("AccentColor"))
                    }
                }
                Spacer()
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80.0, height: 80.0)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color("Light Grey"), lineWidth: 1.0))
            }
            
        }
        .padding(40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Floral White"))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
