//
//  HomeView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 25/8/2023.
//

import SwiftUI

// array of Product objects
var products: [Product] = [
    Product(image: "cerave-hydrating-foaming-oil-cleanser", brand: "CeraVe", product: "Hydrating Foaming Oil Cleanser", rating: 4.8, desc: "Developed with dermatologists, CeraVe Hydrating Foaming Oil Cleanser gently cleanses and replenishes the skin’s moisture levels for all day hydration. The ultra-mild foaming texture provides a gentle approach to cleansing, without drying out the skin. The transformation of oil to foam when lathered on the skin effectively removes excess dirt and impurities, without stripping the skin moisture barrier, an ideal squalane cleanser formula for those with dry or sensitive skin."),
    Product(image: "the-ordinary-hyaluronic-acid", brand: "The Ordinary.", product: "Hyaluronic Acid 2% + B5", rating: 3.5, desc: "Hyaluronic Acid 2% + B5 is a water-based formula combining low-, medium- and high-molecular-weight hyaluronic acid molecules and a next-generation HA crosspolymer to support hydration to multiple layers of your skin. It also targets the appearance of wrinkles and textural irregularities. Plus, it uses pro-vitamin B5 to enhance hydration at the outer layers, resulting in smoother, plumper skin."),
    Product(image: "paulas-choice-bha-liquid-exfoliant", brand: "Paula's Choice", product: "2% BHA Liquid Exfoliant", rating: 4.1, desc: "Our #1 product worldwide + cult favorite, this clinically proven gentle leave-on exfoliant with salicylic acid quickly unclogs pores, smooths wrinkles & evens skin tone."),
    Product(image: "cetaphil-gentle-skin-cleanser", brand: "Cetaphil", product: "Gentle Skin Cleanser", rating: 3.1, desc: "This creamy formula is clinically proven to provide continuous hydration to protect against dryness. Formula that gently yet effectively removes dirt, makeup and impurities."),
    Product(image: "clinique-moisture-surge-broad-spectrum-spf-28-sheer-hydrator", brand: "Clinique", product: "Moisture Surge Broad Spectrum SPF 28 Sheer Hydrator", rating: 2.9, desc: "A cloud-like cream that delivers the hydration you love from Moisture Surge™, as well as sheer sun protection for every skin tone."),
    Product(image: "olay-vitamin-c-peptide-24-brightening-eye-cream", brand: "Olay", product: "Vitamin C + Peptide 24 Brightening Eye Cream", rating: 5.0, desc: "Eye moisturizer that hydrates to brighten the delicate skin around your eyes.")
]

struct HomeView: View {
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // stack for top introductory text
                HStack {
                    ScreenTitle(title: "Hi \n\(user.name)")
                    Spacer()
                    NavigationLink(destination: ProfileView(user).navigationBarBackButtonHidden(true)) {
                        Image("profile")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 90)
                    }
                }
                .padding(.bottom, 10)
                .padding(.horizontal, 10)
                
                Subheading(subheading: "We have some recommendations for you.")
                    .padding(.bottom, 10)
                
                ScrollView {
                    // list of recommended products using ProductCardView
                    VStack(alignment: .leading) {
                        ForEach(products) {
                            // iterating through products array to produce view for each product
                            product in ProductCardView(image: product.image, brand: product.brand, product: product.product)
                        }
                        .padding(.horizontal, 5)
                    }
                    
                }
            }
            .modifier(ScreenModifier())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: users[1])
    }
}
