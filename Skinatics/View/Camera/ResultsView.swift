//
//  ResultsView.swift
//  Skinatics
//
//  Created by Nhii on 6/9/2023.
//

import SwiftUI


struct Result: Hashable {
    var section: String
    var score: Int
    var color: Color
}

let results = [Result(section: "Radiance", score: 50, color: Color("Bronze")), Result(section: "Lines", score: 85, color: Color("Secondary Green")), Result(section: "Hydration", score: 85, color: Color("Secondary Green")), Result(section: "Texture", score: 75, color: Color("Yellow Green"))]

struct ResultsView: View {
    var resultItems: [Result]
    var twoColumnGrid: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    @State private var showSheet = false
    @State private var infoSheetSelected: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                Text("Today's Results").largeTitle(multilineCenter: true)
            
                VStack {
                    LazyVGrid(columns: twoColumnGrid, spacing: 20) {
                        ForEach(resultItems, id: \.self) { item in
                            VStack(spacing: 5) {
                                Gauge(value: Double(item.score), in: 0...100) {
                                    Text("\(item.score)")
                                }
                                .tint(item.color)
                                .gaugeStyle(.accessoryCircularCapacity)
                                
                                HStack(alignment: .top, spacing: 2) {
                                    Text(item.section)
                                    Button(action: {
                                        infoSheetSelected = item.section
                                        showSheet = true
                                    }) {
                                        Image(systemName: "info.circle")
                                            .font(.system(size: 12))
                                    }
                                }
                            }
                            .sheet(isPresented: $showSheet, content: {
                                InfoSheetView(section: $infoSheetSelected)
                                    .presentationDragIndicator(.visible)
                            })
                        }
                    }
                    HStack {
                        Text("Overall")
                        Spacer()
                        Text("74")
                            .font(Font.custom("Avenir", size: 30))
                    }
                    .foregroundColor(Color("White"))
                    .bold()
                    .padding(.vertical, 15)
                    .padding(.horizontal, 25)
                    .background(Color("Dark Green"))
                    .clipShape(Capsule())
                    .padding(.top, 20)
                }
                .padding(.vertical, 20)
                
                
                Text("Analysis").title()
                    .padding(.vertical, 10)
                
                VStack(alignment: .leading, spacing: 25) {
                    ResultSection(heading: "Hydration", content: "Your skin appears to be a little less hydrated. Look for products with hyaluronic acid to lock in moisture.")
                    
                    ResultSection(heading: "Radiance", content: "We’re not seeing a change here yet. We recommend getting some good sleep every night and finding a product with vitamin C to help even out uneven skin tone.")
                    
                    ResultSection(heading: "Texture", content: "Your skin texture is getting better, however we still have to work on some texture like acne scars.")
                    
                    ResultSection(heading: "Lines", content: "We can see that there are no visible lines on your skin, great job preventing lines.")
                }
                
                NavigationLink(destination: SkinPhotoView()) {
                    Text("Exit")
                }
                .buttonStyle(PrimaryButtonStyle())
                .padding(.top, 30)
            }
            .padding(.top, 1)
            .modifier(ScreenModifier())
        }
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(resultItems: results)
    }
}
