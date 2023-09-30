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
    @EnvironmentObject var authenticator: Authenticator
    @State var showError = false
    @State var errorMessage = ""
    
    func updateUserInfo() {
        authenticator.user.userMetadata["skinConditions"] = Array(selected)
        authenticator.user.userMetadata["didFinishSignUp"] = true
        
        let attributes = UserPatchAttributes()
            .userMetadata(authenticator.user.userMetadata)
        
        authenticator.credentialsManager.credentials { result in
            switch result {
            case .success(let credentials):
                Auth0
                    .users(token: credentials.accessToken)
                    .patch(authenticator.user.id, attributes: attributes)
                    .start { result in
                        switch result {
                        case .success(_):
                            print("Finish updating user info.")
                        case .failure(let error):
                            print("Failed with: \(error.localizedDescription)")
                        }
                    }
            case .failure(let error):
                print("Failed with: \(error.localizedDescription)")
            }
        }
    }
 
    // add selected options to user data
    var body: some View {
        QuizTemplate(title: "Any skin conditions?", subheading: "(Optional) Select any conditions you may have", show: false, options: conditions, selected: $selected, screen: ContentView().navigationBarBackButtonHidden(), btnText: "Submit", selectionOptional: true, action: {updateUserInfo()}, showUpdateError: $showError, errorMessage: $errorMessage)
    }
}

struct SkinConditionView_Previews: PreviewProvider {
    static var previews: some View {
        SkinConditionView(selected: Set<String>())
    }
}
