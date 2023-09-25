//
//  ScannerView.swift
//  Skinatics
//
//  Created by Nhii on 15/9/2023.
//

import SwiftUI
import VisionKit

struct ScannerView: View {
    @State var startScanning = false
    @State var scannedItem: String = "602004138200"
    @State var scannerType: ScannerType
    //@State private var productId = ""
    //@State var isLoading = false
//    @State var showNextView = false
//    @State var showAlert = false
    @StateObject private var viewModel = ScannerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Scanner(startScanning: $startScanning, recognizedItem: $scannedItem, dataType: viewModel.dataType)
                
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
                .font(Font.custom("Avenir", size: 18, relativeTo: .body))
                .background(Color("Floral White"))
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
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannerType: .barcode)
    }
}
