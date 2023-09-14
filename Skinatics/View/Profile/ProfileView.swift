//
//  ProfileView.swift
//  Skinatics
//
//  Created by Nhii on 27/8/2023.
//

import SwiftUI

/// Profile screen to show user info
struct ProfileView: View {
    // Current user
    @State private var user: User
    
    init(_ user: User) {
        _user = State(initialValue: user)
    }
    
    var body: some View {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("My Profile").largeTitle(multilineCenter: true)
                    // Avatar
                    Image("profile")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 150)
                        .padding(.bottom, 60)
                    
                    // User info
                    EditField(title: "Name", text: user.name)
                    EditField(title: "Email", text: user.email)

                    
                    // Skin Info
                    HStack {
                        Text("My Skin").title()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Edit")
                            .font(Font.custom("Avenir", size: 16))
                            .foregroundColor(Color("Secondary Green"))
                            .fontWeight(.semibold)
                    }
                    SkinInfo(title: "Skin Type", items: Array(user.skinTypes))
                    
                    SkinInfo(title: "Skin Conditions", items: Array(user.skinConditions))
                    
                    SkinInfo(title: "I Need Help With...", items: Array(user.skinIssues))
                }
                .padding(.vertical)
            }
            .modifier(ScreenModifier())
        }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(users[1])
    }
}
