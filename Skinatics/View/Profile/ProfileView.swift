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
                ScreenTitle(title: "My Profile")
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
                    SectionTitle(title: "My Skin")
                    Text("Edit")
                        .foregroundColor(.accentColor)
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
