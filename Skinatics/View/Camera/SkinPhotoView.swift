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
    @StateObject private var viewModel = CameraViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    switch viewModel.accessStatus {
                    case .notDetermined:
                        Text("We are requesting your camera access. Please give access to use this feature.")
                    case .noCameraAvailable:
                        Text("There is no camera on your phone. Please use a device that supports camera to use this feature.")
                    case .noCameraAccess:
                        Text("Please provide access to use your camera in settings.")
                    case .cameraAvailable:
                        // photo taken
                        Image(uiImage: currentPhoto)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .center)
                
                Spacer()
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
                    if viewModel.accessStatus == .cameraAvailable {
                        showCamera = true
                    }
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
            .onAppear(perform: {
                viewModel.requestAccessStatus()
            })
        }
    }
}


struct SkinPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        SkinPhotoView()
    }
}
