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
    @State var scannedItem: String = ""
    @State var scannerType: ScannerType
    @State private var productId = ""
    
    func getData() {
        // API endpoint
        let url = URL(string: "https://sephora.p.rapidapi.com/products/v2/search-by-barcode?upcs=\(scannedItem)&country=AU&language=en-AU")!
        
        guard let apiKey = InfoPlistHandler.getValue(key: "API_KEY") as? String else {
            return
        }
        guard let apiHost = InfoPlistHandler.getValue(key: "API_HOST") as? String else {
            return
        }
        
        var request = URLRequest(url: url)
        // set request header
        request.setValue(apiKey, forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue(apiHost, forHTTPHeaderField: "X-RapidAPI-Host")
        
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
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Scanner(startScanning: $startScanning, recognizedItem: $scannedItem, scannerType: $scannerType)
    
            VStack(alignment: .leading, spacing: 10) {
                Text("Use the scanner camera to tap on the information you would like to scan").bold()
                Text(scannedItem == "" ? "No item has been scanned" : "Found the following item: ")
                Text(scannedItem)
                
                NavigationLink(destination: ProductDetailView(product: productsList[1])) {
                    Text("Search")
                    Image(systemName: "magnifyingglass")
                }
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
