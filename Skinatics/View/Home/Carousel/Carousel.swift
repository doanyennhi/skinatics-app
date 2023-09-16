//
//  Carousel.swift
//  Skinatics
//
//  Created by Marielle Louisse Lopez on 16/9/2023.
//

import SwiftUI

struct Carousel: View {
    // view properties
    @State private var cells: [CarouselCell] = []
    @State private var index: Int = 0
    @State private var previewImage: UIImage?
    
    var cellImages = ["paulas-choice-bha-liquid-exfoliant-style", "cerave-hydrating-foaming-oil-cleanser-style", "the-ordinary-hyaluronic-acid-style"]
    
    var body: some View {
        VStack(spacing: 0) {
            // snap interval carousel
            GeometryReader {
                let size = $0.size
                let pageWidth: CGFloat = size.width / 3
                let imageWidth: CGFloat = 125
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(cells) { cell in
                            ZStack {
                                if let thumbnail = cell.thumbnail {
                                    Image(uiImage: thumbnail)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: imageWidth, height: size.height)
                                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                }
                            }
                            .frame(width: pageWidth, height: size.height)
                        }
                    }
                    
                    // start from center
                    .padding(.horizontal, (size.width - pageWidth) / 2)
                    .background {
                        SnapCarouselHelper(pageWidth: pageWidth, pageCount: cells.count, index: $index)
                    }
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(.black, lineWidth: 3)
                        .frame(width: imageWidth, height: size.height)
                        // disabling user interactions
                        .allowsHitTesting(false)
                }
            }
            .frame(height: 120)
            .padding(.bottom, 10)
            
            GeometryReader {
                let size = $0.size
                
                if let previewImage {
                    Image(uiImage: previewImage)
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                        .onChange(of: index) { newValue in
                            withAnimation(.easeInOut(duration: 0.3)) {
                                self.previewImage = UIImage(named: cells[newValue].imageName)
                            }
                        }
                }
            }
            .padding(.vertical, 15)
        }
        .task {
            // adding images
            guard cells.isEmpty else { return }
            // first image is initial preview image
            previewImage = UIImage(named: cellImages[0])
            
            for cellImage in cellImages {
                if let thumbnail = await UIImage(named: cellImage)?.byPreparingThumbnail(ofSize: CGSize(width: 300, height: 300)) {
                    cells.append(.init(imageName: cellImage, thumbnail: thumbnail))
                }
            }
        }
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel()
    }
}
