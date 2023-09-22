//
//  ScannerViewModel.swift
//  Skinatics
//
//  Created by Nhii on 23/9/2023.
//

import Foundation
import UIKit
import VisionKit
import AVFoundation

enum ScannerType: String {
    case text, barcode
}

enum ScannerAccessStatus {
    case noCameraAvailable
    case noCameraAccess
    case noScannerAvailable
    case scannerAvailable
    case notDetermined
}

@MainActor
final class ScannerViewModel: ObservableObject {
    
    @Published var scannerType: ScannerType = .text
    @Published var accessStatus: ScannerAccessStatus = .notDetermined
    
    var dataType: DataScannerViewController.RecognizedDataType {
        return scannerType == .text ? .text() : .barcode()
    }
    
    func requestAccessStatus() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            accessStatus = .noCameraAvailable
            return
        }
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .restricted, .denied:
            accessStatus = .noCameraAccess
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                if granted {
                    self.accessStatus = DataScannerViewController.isAvailable && DataScannerViewController.isSupported ? .scannerAvailable : .noScannerAvailable
                } else {
                    self.accessStatus = .noCameraAccess
                }
            })
            
        case .authorized:
            accessStatus = DataScannerViewController.isAvailable && DataScannerViewController.isSupported ? .scannerAvailable : .noScannerAvailable
            
        @unknown default:
            return
        }
    }
}
