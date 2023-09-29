//
//  SkinConditionView.swift
//  Skinatics
//
//  Created by Nhii on 18/8/2023.
//

import SwiftUI
import Auth0

// skin condition options
var conditions: [String] = ["Acne", "Rosacea", "Eczema", "Rash", "Melasma", "Hives", "Psoriasis", "Dermatitis"]

// Third quiz, quiz on skin conditions
struct SkinConditionView: View {
    @State var selected = Set<String>()
    @State var user: User
    @EnvironmentObject var authenticator: Authenticator
    @State var errorMessage = ""
    
    // TODO: get correct username and skin info
    func updateUserInfo() async {
        var credentials: Credentials?
        authenticator.credentialsManager.credentials { result in
            switch result {
            case .success(let res):
                credentials = res
            case .failure(let error):
                print("Failed with: \(error.localizedDescription)")
                credentials = nil
            }
        }
        
        let attributes = UserPatchAttributes()
            .username("Sae Itoshi", connection: "Username-Password-Authentication")
            .userMetadata(["skin_condition": Array(selected), "last_name": "Appleseed"])
            .appMetadata(["didFinishProfile": true])
        
        Auth0
            .users(token: credentials?.accessToken ?? "")
            .patch(authenticator.user.id, attributes: attributes)
            .start { result in
                switch result {
                case .success(let user):
                    print("Updated user: \(user)")
                case .failure(let error):
                    print("Failed with: \(error.localizedDescription)")
                }
            }
    }
 
    // add selected options to user data
    var body: some View {
        QuizTemplate(title: "Any skin conditions?", subheading: "(Optional) Select any conditions you may have", show: false, options: conditions, selected: $selected, screen: MainTabView(user: user).navigationBarBackButtonHidden(), btnText: "Submit", selectionOptional: true, action: {user.skinConditions = selected})
    }
}

struct SkinConditionView_Previews: PreviewProvider {
    static var previews: some View {
        SkinConditionView(selected: Set<String>(), user: User())
    }
}
