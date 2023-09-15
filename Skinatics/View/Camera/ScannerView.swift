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
    @State var scannedItems: [RecognizedItem] = []
    @State var value: String = ""
    
    var body: some View {
        VStack {
            Scanner(startScanning: $startScanning, recognizedItems: $scannedItems)
            
            ForEach(scannedItems) { item in
                switch item {
                case .barcode(let barcode):
                    Text(barcode.payloadStringValue ?? "Unknown payload")
                default:
                    Text("")
                }
            }
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
    @Binding var recognizedItems: [RecognizedItem]
    
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let controller = DataScannerViewController(
            recognizedDataTypes: [.barcode()],
            qualityLevel: .accurate,
            isHighlightingEnabled: true
        )
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if startScanning {
            try? uiViewController.startScanning()
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
            parent.recognizedItems.append(item)
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            parent.recognizedItems.append(contentsOf: addedItems)
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
