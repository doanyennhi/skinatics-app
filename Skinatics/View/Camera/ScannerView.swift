//
//  ScannerView.swift
//  Skinatics
//
//  Created by Nhii on 15/9/2023.
//

import SwiftUI
import VisionKit

enum ScannerType: String {
    case text, barcode
}

struct ScannerView: View {
    @State var startScanning = false
    @State var scannedItem: String = "602004138200"
    @State var scannerType: ScannerType
    @State private var productId = ""
    @State var isLoading = false
    @State var showNextView = false
    
    func getData() async {
        isLoading = true
        guard let request = setRequestHeader(link: "https://sephora.p.rapidapi.com/products/v2/search-by-barcode?upcs=\(scannedItem)&country=AU&language=en-AU") else { return }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let res = response as? HTTPURLResponse else { return }
            guard let data = data else { return }
            
            do {
                // get error message if request unsuccessful
                if (400...499).contains(res.statusCode) {
                    let decodedData = try JSONDecoder().decode(Error.self, from: data)
                    print(decodedData)
                } else {
                    // decode data
                    let decodedData = try JSONDecoder().decode(ProductSearch.self, from: data)
                    
                    // send task back to main thread
                    DispatchQueue.main.async {
                        self.productId = decodedData.data.attributes.productId
                        print(productId)
                        showNextView = !productId.isEmpty
                        isLoading = false
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Scanner(startScanning: $startScanning, recognizedItem: $scannedItem, scannerType: $scannerType)
        
                VStack(alignment: .leading, spacing: 10) {
                    Text("Use the scanner camera to tap on the information you would like to scan").bold()
                    Text(scannedItem == "" ? "No item has been scanned" : "Found the following item: ")
                    Text(scannedItem)
                    
                    Button (action: {
                        // start running function
                        Task {
                            //await getData()
                        }
                    }, label: {
                        if isLoading {
                            ProgressView()
                                .tint(Color("White"))
                        } else {
                            HStack {
                                Text("Search")
                                Image(systemName: "magnifyingglass")
                            }
                        }
                    })
                    .disabled(isLoading)
                    // go to skin quiz if user has not completed it, go to Home otherwise
                    .navigationDestination(isPresented: $showNextView, destination: {
                        ProductDetailView(product: productsList[1], productId: productId)})
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
            .task {
                if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                    startScanning = true
                } else {
                    print("Not supported or available")
                }
        }
        }
    }
}

struct Scanner: UIViewControllerRepresentable {
    @Binding var startScanning: Bool
    @Binding var recognizedItem: String
    @Binding var scannerType: ScannerType
    var dataType: DataScannerViewController.RecognizedDataType {
        return scannerType == .text ? .text() : .barcode()
    }
    
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let controller = DataScannerViewController(
            recognizedDataTypes: [dataType],
            qualityLevel: .accurate,
            isHighFrameRateTrackingEnabled: false,
            isHighlightingEnabled: true
        )
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if startScanning {
            try? uiViewController.startScanning()
            print(dataType)
        } else {
            uiViewController.stopScanning()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    final class Coordinator: NSObject, DataScannerViewControllerDelegate {
        var parent: Scanner
        
        init(parent: Scanner) {
            self.parent = parent
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            switch item {
            case .text(let text):
                parent.recognizedItem = text.transcript
            case .barcode(let barcode):
                parent.recognizedItem = barcode.payloadStringValue ?? "Unknown payload"
            default:
                parent.recognizedItem = ""
            }
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView(scannerType: .barcode)
    }
}
