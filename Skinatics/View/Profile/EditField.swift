//
//  EditableField.swift
//  Skinatics
//
//  Created by Nhii on 27/8/2023.
//

import SwiftUI

// Define an information field that can be edit
struct EditField: View {
    @State private var title: String
    @State private var text: String
    // allow or disable editing mode
    @State private var isEditing: Bool = false
    // show or hide error message
    @State private var showError: Bool = false
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.accentColor)
                .bold()
                .font(.title2)
            
            HStack {
                // info field
                TextField(title, text: $text)
                    .disabled(!isEditing)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .font(.system(size: 20))
                
                // toggle between allow and disable for editing
                Text(isEditing ? "Done" : "Edit")
                    .foregroundColor(.accentColor)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        // show error message if text empty
                        if text.isEmpty && isEditing {
                            showError = true
                        } else {
                            showError = false
                            isEditing.toggle()
                        }
                    }
            }
            .padding(.bottom, 3)
            Divider()
            ErrorText(show: $showError, text: "This field cannot be empty")
        }
        .padding(.bottom, 30)
    }
}

struct EditableField_Previews: PreviewProvider {
    static var previews: some View {
        EditField(title: "Name", text: "Itoshi Rin")
    }
}
