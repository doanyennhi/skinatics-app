//
//  ProfileView.swift
//  Skinatics
//
//  Created by Nhii on 27/8/2023.
//

import SwiftUI

/// Profile screen to show user info
struct ProfileView: View {
    // user info
    @State private var user: User
    @State private var name: String
    @State private var email: String
    
    init(_ user: User) {
        _user = State(initialValue: user)
        _name = State(initialValue: user.name)
        _email = State(initialValue: user.email)
    }
    
    var body: some View {
        VStack {
            ScreenTitle(title: "My Profile")
            // avatar
            Image("profile")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 150)
                .padding(.bottom, 60)
            
            EditField(title: "Name", text: name)
            EditField(title: "Email", text: email)
        }
        .padding(.horizontal, 30)
        .font(Font.custom("Avenir", size: 18))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Floral White"))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(users[1])
    }
}
