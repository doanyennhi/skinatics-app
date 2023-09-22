//
//  CameraView.swift
//  Skinatics
//
//  Created by Nhii on 5/9/2023.
//

import SwiftUI

struct SkinPhotoView: View {
    @State var showCamera: Bool = false
    @State var showScannerDialog: Bool = false
    var scannerType: ScannerType?
    @State var currentPhoto = UIImage()
    
    var body: some View {
        NavigationStack {
            VStack {
                // photo taken
                Image(uiImage: currentPhoto)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                // open scanner
                Button(action: {
                    showScannerDialog = true
                }, label: {
                    Text("Scanner")
                })
                .confirmationDialog("Choose a scanner type", isPresented: $showScannerDialog) {
                    NavigationLink(destination: ScannerView(scannerType: .text)) {
                        Text("Scan ingredient")
                    }
                    NavigationLink(destination: ScannerView(scannerType: .barcode)) {
                        Text("Scan product barcode")
                    }
                }
                .buttonStyle(SecondaryButtonStyle())
                
                // open camera
                Button(action: {
                    showCamera = true
                }, label: {
                    Text("Take skin photo")
                })
                .buttonStyle(PrimaryButtonStyle())
            }
            .padding(.bottom, 20)
            .modifier(ScreenModifier())
            .fullScreenCover(isPresented: $showCamera, content: { CameraView(photo: $currentPhoto)
                    .ignoresSafeArea()
            })
        }
    }
}


struct SkinPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        SkinPhotoView()
    }
}
