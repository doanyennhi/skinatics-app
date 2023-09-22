//
//  Scanner.swift
//  Skinatics
//
//  Created by Nhii on 23/9/2023.
//

import Foundation
import SwiftUI
import VisionKit

struct Scanner: UIViewControllerRepresentable {
    @Binding var startScanning: Bool
    @Binding var recognizedItem: String
    var dataType: DataScannerViewController.RecognizedDataType
    
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
