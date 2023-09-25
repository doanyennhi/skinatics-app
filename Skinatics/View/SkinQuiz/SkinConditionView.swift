//
//  SkinConditionView.swift
//  Skinatics
//
//  Created by Nhii on 18/8/2023.
//

import SwiftUI

// skin condition options
var conditions: [String] = ["Acne", "Rosacea", "Eczema", "Rash", "Melasma", "Hives", "Psoriasis", "Dermatitis"]

// Third quiz, quiz on skin conditions
struct SkinConditionView: View {
    @State var selected = Set<String>()
    @State var user: User
    @EnvironmentObject var authenticator: Authenticator
    @State var errorMessage = ""
    
    func updateUserInfo() async {
        var param: Data?
        var profile = authenticator.user
        do {
            let userJson = try JSONEncoder().encode(profile)
            param = String(data: userJson, encoding: .utf8)?.data(using: .utf8)
        } catch {
            errorMessage = "Error: \(error.localizedDescription)"
            return
        }
        
        var request = URLRequest(url: URL(
            string: "https://login.auth0.com/api/v2/users/\(user.id)")!, timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "PATCH"
        request.httpBody = param
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8)!)
        }
        task.resume()
    }
 
    // add selected options to user data
    var body: some View {
        QuizTemplate(title: "Any skin conditions?", subheading: "(Optional) Select any conditions you may have", show: false, options: conditions, selected: $selected, screen: MainView(user: user).navigationBarBackButtonHidden(), btnText: "Submit", selectionOptional: true, action: {user.skinConditions = selected})
    }
}

struct SkinConditionView_Previews: PreviewProvider {
    static var previews: some View {
        SkinConditionView(selected: Set<String>(), user: User())
    }
}
