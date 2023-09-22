//
//  HomeView.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 25/8/2023.
//

import SwiftUI

// array of Product objects
var productsList: [Product] = [
    Product(id: "0", attributes: ProductAttributes(name: "Hydrating Foaming Oil Cleanser", rating: 4.8, description: "Developed with dermatologists, CeraVe Hydrating Foaming Oil Cleanser gently cleanses and replenishes the skin’s moisture levels for all day hydration. The ultra-mild foaming texture provides a gentle approach to cleansing, without drying out the skin. The transformation of oil to foam when lathered on the skin effectively removes excess dirt and impurities, without stripping the skin moisture barrier, an ideal squalane cleanser formula for those with dry or sensitive skin.", ingredients: "AQUA/WATER, GLYCERIN, PEG-200 HYDROGENATED GLYCERYL PALMATE, COCO-BETAINE, DISODIUM COCOYL GLUTAMATE, PEG-120 METHYL GLUCOSE DIOLEATE, POLYSORBATE 20, PEG-7 GLYCERYL COCOATE, SQUALANE, CERAMIDE NP, CERAMIDE AP, CERAMIDE EOP, CARBOMER, TRIETHYL CITRATE, SODIUM CHLORIDE, SODIUM HYDROXIDE, SODIUM COCOYL GLUTAMATE, SODIUM BENZOATE, SODIUM LAUROYL LACTYLATE, SODIUM HYALURONATE, CHOLESTEROL, CITRIC ACID, CAPRYLOYL GLYCINE, HYDROXYACETOPHENONE, CAPRYLYL GLYCOL, CAPRYLIC/ CAPRIC TRIGLYCERIDE, TRISODIUM ETHYLENEDIAMINE DISUCCINATE, PHYTOSPHINGOSINE, XANTHAN GUM, BENZOIC ACID, PEG-150 PENTAERYTHRITYL TETRASTEARATE, PPG-5-CETETH-20, PEG-6 CAPRYLIC/CAPRIC GLYCERIDE", benefits: "Yay", imageUrls: ["cerave-hydrating-foaming-oil-cleanser"])),
    
    Product(id: "1", attributes: ProductAttributes(name: "Hyaluronic Acid 2% + B5", rating: 3.5, description: "Hyaluronic Acid 2% + B5 is a water-based formula combining low-, medium- and high-molecular-weight hyaluronic acid molecules and a next-generation HA crosspolymer to support hydration to multiple layers of your skin. It also targets the appearance of wrinkles and textural irregularities. Plus, it uses pro-vitamin B5 to enhance hydration at the outer layers, resulting in smoother, plumper skin.", ingredients: "Aqua (Water), Sodium Hyaluronate, Pentylene Glycol, Propanediol, Sodium Hyaluronate Crosspolymer, Panthenol, Ahnfeltia Concinna Extract, Glycerin, Trisodium Ethylenediamine Disuccinate, Citric Acid, Isoceteth-20, Ethoxydiglycol, Ethylhexylglycerin, Hexylene Glycol, 1,2-Hexanediol, Phenoxyethanol, Caprylyl Glycol", benefits: "Yay", imageUrls: ["the-ordinary-hyaluronic-acid"])),
    
    Product(id: "2", attributes: ProductAttributes(name: "2% BHA Liquid Exfoliant", rating: 4.1, description: "Our #1 product worldwide + cult favorite, this clinically proven gentle leave-on exfoliant with salicylic acid quickly unclogs pores, smooths wrinkles & evens skin tone.", ingredients: "Methylpropanediol⁠, Salicylic Acid⁠, Green Tea⁠, BHA (Beta Hydroxy Acid)⁠, Water⁠, Methylpropanediol⁠, Butylene Glycol⁠, Salicylic Acid⁠, Polysorbate 20⁠, Camellia Oleifera⁠, Sodium Hydroxide⁠, Tetrasodium EDTA⁠", benefits: "Yay", imageUrls: ["paulas-choice-bha-liquid-exfoliant"])),
    
    Product(id: "3", attributes: ProductAttributes(name: "Gentle Skin Cleanser", rating: 3.1, description: "This creamy formula is clinically proven to provide continuous hydration to protect against dryness. Formula that gently yet effectively removes dirt, makeup and impurities.", ingredients: "Aqua, Glycerin, Cetearyl Alcohol, Panthenol, Niacinamide, Pantolactone, Xanthan Gum, Sodium Cocoyl Isethionate, Sodium Benzoate,  Citric Acid", benefits: "Yay", imageUrls: ["cetaphil-gentle-skin-cleanser"])),
    
    Product(id: "4", attributes: ProductAttributes(name: "Moisture Surge Broad Spectrum SPF 28 Sheer Hydrator", rating: 2.9, description: "A cloud-like cream that delivers the hydration you love from Moisture Surge™, as well as sheer sun protection for every skin tone.", ingredients: "Avobenzone 3.0%, Homosalate 7.0%, Octinoxate 7.0%, Octisalate 4.5%, Water/Aqua/Eau, Butylene Glycol, Ethylhexyl Methoxycrylene, Butyloctyl Salicylate, Dextrin Palmitate, Polymethylsilsesquioxane, Glycerin, Lactobacillus Ferment Lysate, Aloe Barbadensis Leaf Polysaccharides, Sodium Hyaluronate, Caffeine, Sodium Polyaspartate, 7-Dehydrocholesterol, Caprylyl Glycol, Acrylates Copolymer, Sorbitol, Dimethicone, Polyglyceryl-2 Stearate, Sucrose, Saccharide Isomerate, Hydroxyethyl Urea, PPG-8-Ceteth-20, Sorbeth-30 Tetraisostearate, Glyceryl Stearate, Sorbitan Sesquiisostearate, Potassium Hydroxide, Carbomer, Dipropylene Glycol, Dehydroxanthan Gum, Stearyl Alcohol, Sodium Polyacryloyldimethyl Taurate, Hexylene Glycol, Acrylates/Beheneth-25 Methacrylate Copolymer, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Tocopheryl Acetate, BHT, Disodium EDTA, Sodium Citrate, Citric Acid, Potassium Sorbate, Sodium Benzoate, Phenoxyethanol, Red 4 (CI 14700).", benefits: "Yay", imageUrls: ["clinique-moisture-surge-broad-spectrum-spf-28-sheer-hydrator"])),
    
    Product(id: "5", attributes: ProductAttributes(name: "Vitamin C + Peptide 24 Brightening Eye Cream", rating: 5.0, description: "Eye moisturizer that hydrates to brighten the delicate skin around your eyes.", ingredients: "WATER, GLYCERIN, DIMETHICONE, NIACINAMIDE*, PROPYLENE GLYCOL, BUTYLENE GLYCOL, 3-O-ETHYL ASCORBIC ACID**, PALMITOYL PENTAPEPTIDE-4***, PANTHENOL, ETHYLHEXYLGLYCERIN, HYDROXYACETOPHENONE, DIMETHICONOL, C13-14 ISOPARAFFIN, POLYSORBATE 20, LAURETH-4, LAURETH-7, DISODIUM EDTA, TAPIOCA STARCH, POLYACRYLAMIDE, ACRYLATES/C10-30 ALKYL ACRYLATE CROSSPOLYMER, AMINOMETHYL PROPANOL, POLYMETHYLSILSESQUIOXANE, PHENOXYETHANOL *Vitamin B3 , **Vitamin C, ***Peptides", benefits: "Yay", imageUrls: ["olay-vitamin-c-peptide-24-brightening-eye-cream"])),
]

struct HomeView: View {
    var user: User
    @State private var index = 0       // banner item index
    // banner cards' content
    var cardTitles: [String] = ["Take your quiz again", "Do your night routine", "Do another skin analysis"]
    var cardIcons: [String] = ["arrow.triangle.2.circlepath", "moon.fill", "faceid"]
    @Binding var products: [Product]
    @Binding var isLoading: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                // stack for top introductory text
                HStack {
                    Text("Hi, \n\(user.name)").largeTitle(multilineCenter: false)
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
                
                // stack for carousel
                VStack {
                    TabView(selection: $index) {
                        ForEach((0..<3), id: \.self) { index in
                            BannerItem(title: cardTitles[index], icon: cardIcons[index])
                        }
                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    // carousel indicators
                    HStack(spacing: 7) {
                        ForEach((0..<3), id: \.self) { index in
                            Circle()
                                .fill(index == self.index ? Color("AccentColor") : Color("Light Grey"))
                                .frame(width: 7, height: 7)
                        }
                    }
                }
                .frame(height: 150)
                .padding(.bottom, 15)
                
                // carousel for recommended products
                VStack {
                    Text("Recommended for you")
                        .title()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                        if !isLoading {
                            if products.isEmpty {
                                Text("We cannot find any products")
                                    .padding()
                            } else {
                                ScrollView(.horizontal) {
                                    LazyHStack(spacing: 20) {
                                        ForEach(products) { product in
                                            RecommendedCard(product: product)
                                        }
                                    }
                                    .padding(.bottom)
                                }
                            }
                        } else {
                            ProgressView()
                        }
                }
                .padding(.bottom, 25)
                .padding(.top, 10)
                
                // product of the day
                VStack {
                    Text("Product of the day")
                        .title()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if !isLoading {
                        if let product = products.randomElement() {
                            ProductOfTheDay(product: product)
                        } else {
                            Text("No product for today")
                                .padding()
                        }
                    } else {
                        ProgressView()
                    }
                }
            }
            .modifier(ScreenModifier())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(user: users[1], products: .constant(productsList), isLoading: .constant(false))
    }
}
