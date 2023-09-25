//
//  ScannerView.swift
//  Skinatics
//
//  Created by Nhii on 15/9/2023.
//

import SwiftUI
import VisionKit

// TODO: Test camera again
struct ScannerView: View {
    @State var startScanning = false
    @State var scannedItem: String = "602004138200"
    @State var scannerType: ScannerType
    @StateObject private var viewModel = ScannerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                    switch viewModel.accessStatus {
                    case .notDetermined:
                        Text("We are requesting your camera access. Please give access to use the scanner.")
                    case .noCameraAvailable:
                        Text("There is no camera on your phone. Please use a device that supports camera to use the scanner.")
                    case .noCameraAccess:
                        Text("Please provide access to use your camera in settings.")
                    case .noScannerAvailable:
                        Text("The scanner feature is not support or available.")
                    case .scannerAvailable:
                        scanner
                    }
            }
            .modifier(ScreenModifier())
        }
        .alert("Error", isPresented: $viewModel.showAlert, actions: {
            Button("OK", role: .cancel) {
                viewModel.showNextView = false
            }
        }, message: {
            Text("There is an error while searching for the item. Please try again.")
        })
        .task {
            viewModel.requestAccessStatus()
            print(viewModel.accessStatus)
            if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                startScanning = true
            } else {
                print("Not supported or available")
            }
        }
    }
    
    var scanner: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Use the scanner camera to tap on the information you would like to scan").bold()
            Text(scannedItem == "" ? "No item has been scanned" : "Found the following item: ")
            Text(scannedItem)
            
            Button (action: {
                // start running function
                Task {
                    await viewModel.getProductByBarcode(scannedItem: scannedItem)
                }
            }, label: {
                if viewModel.isLoading {
                    ProgressView()
                        .tint(Color("White"))
                } else {
                    HStack {
                        Text("Search")
                        Image(systemName: "magnifyingglass")
                    }
                }
            })
            .disabled(viewModel.isLoading)
            // go to skin quiz if user has not completed it, go to Home otherwise
            .navigationDestination(isPresented: $viewModel.showNextView, destination: {
                ProductDetailView(productId: viewModel.result)})
            .padding(10)
            .background(Color.accentColor)
            .foregroundColor(Color("White"))
            .bold()
            .cornerRadius(15)
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding([.top, .horizontal], 20)
    }
}
            

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannerType: .barcode)
    }
}
