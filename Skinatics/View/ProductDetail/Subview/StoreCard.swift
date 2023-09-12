//
//  StoreCard.swift
//  Skinatics
//
//  Created by Nhii on 7/9/2023.
//

import SwiftUI

struct StoreCard: View {
    private var store: Store
    
    init(store: Store) {
        self.store = store
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(store.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(15)
                

            Text(store.name)
                .foregroundColor(Color("Dark Green"))
                .bold()
            Text(store.address)
                .foregroundColor(Color("Grey"))
                .font(Font.custom("Avenir", size: 16, relativeTo: .body))
        }
        .frame(width: 150)
    }
}

struct StoreCard_Previews: PreviewProvider {
    static var previews: some View {
        StoreCard(store: stores[1])
    }
}
