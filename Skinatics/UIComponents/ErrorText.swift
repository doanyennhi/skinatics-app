//
//  ErrorText.swift
//  Skinatics
//
//  Created by Nhii on 25/8/2023.
//

import SwiftUI

struct ErrorText: View {
    @Binding var show: Bool
    var text: String
    
    var body: some View {
        show ?
            Text(text)
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, alignment: .leading)
         : nil
    }
}
