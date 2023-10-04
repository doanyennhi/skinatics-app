//
//  SearchView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 21/9/2023.
//

import SwiftUI

struct SearchView: View {
    @State var tabSelected: Int = 0
    @State var searchIngredient = ""
    @State var searchProduct = ""
    
    var body: some View {
        NavigationStack {
            TopTabBar(tabItems: ["Ingredients", "Products"], tabSelected: $tabSelected)
                .padding(.vertical, 15)
                .background(Color("Floral White"))
            
            VStack {
                switch tabSelected {
                case 0:
                    IngredientsView(searchText: $searchIngredient)
                        .searchable(text: $searchIngredient, prompt: "Search")
                case 1:
                    ProductsView(searchText: $searchProduct)
                        .searchable(text: $searchProduct, prompt: "Search")
                default: EmptyView()
                }
            }
            .background(Color("Floral White"))
        }
        //.searchable(text: $searchText)
        .modifier(ScreenModifier())
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
