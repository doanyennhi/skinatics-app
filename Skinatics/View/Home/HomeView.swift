//
//  HomeView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 25/8/2023.
//

import SwiftUI

// struct to create Product objects
struct Product: Identifiable {
    var id = UUID().uuidString
    var image: String
    var brand: String
    var product: String
}

// array of Product objects
var products: [Product] = [
    Product(image: "cerave-hydrating-foaming-oil-cleanser", brand: "CeraVe", product: "Hydrating Foaming Oil Cleanser"),
    Product(image: "the-ordinary-hyaluronic-acid", brand: "The Ordinary.", product: "Hyaluronic Acid 2% + B5"),
    Product(image: "paulas-choice-bha-liquid-exfoliant", brand: "Paula's Choice", product: "2% BHA Liquid Exfoliant"),
    Product(image: "cetaphil-gentle-skin-cleanser", brand: "Cetaphil", product: "Gentle Skin Cleanser"),
    Product(image: "clinique-moisture-surge-broad-spectrum-spf-28-sheer-hydrator", brand: "Clinique", product: "Moisture Surge Broad Spectrum SPF 28 Sheer Hydrator"),
    Product(image: "olay-vitamin-c-peptide-24-brightening-eye-cream", brand: "Olay", product: "Vitamin C + Peptide 24 Brightening Eye Cream")
]

struct HomeView: View {
    var body: some View {
        VStack {
            // stack for top introductory text
            VStack(alignment: .leading) {
                ScreenTitle(title: "Hey Jane") // FIXME: change to user's name
                
                Subheading(subheading: "We have some recommendations for you.")
            }
            .padding(.bottom, 20)
            
            ScrollView {
                // list of recommended products using ProductCardView
                VStack(alignment: .leading) {
                    ForEach(products) {
                        // iterating through products array to produce view for each product
                        product in ProductCardView(image: product.image, brand: product.brand, product: product.product)
                }
                    .padding(.horizontal, 25)
                    .padding(.top, 10)
            }

                }
        }
        .padding(.top, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Floral White"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
