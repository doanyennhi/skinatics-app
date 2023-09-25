//
//  StartUpView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 25/8/2023.
//

import SwiftUI
import Auth0

let screenSize: CGRect = UIScreen.main.bounds
let screenWidth = screenSize.width

struct StartUpView: View {
    @EnvironmentObject var authenticator: Authenticator
    @State private var showAlert = false
    @State private var errorMessage = ""
    
    private func login() {
        guard let domain = InfoPlistHandler.getValue(key: "Domain")
            else {
              return
            }
        
        Auth0
        // initiates Universal Login
              .webAuth()
              .audience("https://\(domain)/api/v2/")
              .scope("openid profile email read:current_user update:current_user_metadata")
        // show login dialog
              .start { result in
                switch result {
                  // login failed
                  case .failure(let error):
                    errorMessage = error.localizedDescription
                    showAlert = true
                  // login success
                case .success(let credentials):
                    // store credentials
                    let isStored = authenticator.credentialsManager.store(credentials: credentials)
                    if isStored {
                        self.authenticator.isAuthenticated = true
                        self.authenticator.user = Profile.from(credentials.idToken)
                    } else {
                        self.authenticator.isAuthenticated = false
                        errorMessage = "Cannot sign you in. Please try again."
                        showAlert = true
                    }
                }
              }
    }
    
    var body: some View {
            NavigationStack {
                StartUpLayout {
                    Image("logo-white") // logo
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screenWidth)
                        .padding(.bottom, 10)
                    Text("Skinatics") // app name
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.vertical, 20)
                    Text("Your on-the-go skincare assistant.") // app description
                        .foregroundColor(.white)
                        .padding(.bottom, 60)
                        
                        Button("Get Started") {
                            login()
                        }
                        .buttonStyle(SecondaryButtonStyle())
                        .padding(.horizontal, 20)
                }
                .alert("Login Unsuccessful", isPresented: $showAlert, actions: {
                    Button("OK", role: .cancel) { }
                }, message: {
                    Text("Error: \(errorMessage)")
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                // background color remain constant
                .background(Color(red: 0.204, green: 0.306, blue: 0.255))
            }
    }
}

// custom layout for StartUpView
struct StartUpLayout: Layout {
    // determining dimensions of view
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout()) -> CGSize {
        guard !subviews.isEmpty else { return .zero } // checks if there are no subviews
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        // establishing custom layout view width and height dimension is screen width and height
        return CGSize(width: screenWidth, height: screenHeight)
    }
    
    // determining position of subviews in view
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout()) {
        guard !subviews.isEmpty else { return } // checks if there are no subviews
        
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        _ = subviewSizes.map { $0.height } // heights of each subview
        
        var y = bounds.midY // y-coordinate set at midpoint of minY and maxY
        
        // iterating through each subview
        for (index, subview) in subviews.enumerated() {
            let subviewSize = subviewSizes[index] // height of current subview
            let proposedSize = ProposedViewSize(width: screenWidth, height: subviewSize.height)
            
            if index == 0 { // logo
                y -= subviewSize.height // set y-coordinate so that bottom border of logo sits on midY
                subview.place(at: CGPoint(x: bounds.midX, y: y), anchor: .top, proposal: proposedSize)
                
            }
            else { // app name, app description, buttons
                // everything except logo is placed below one another and under mid Y
                subview.place(at: CGPoint(x: bounds.midX, y: y), anchor: .top, proposal: proposedSize)
            }
            y += subviewSize.height // update y-coordinate
        }
    }
}


struct StartUpView_Previews: PreviewProvider {
    static var previews: some View {
        StartUpView()
    }
}


