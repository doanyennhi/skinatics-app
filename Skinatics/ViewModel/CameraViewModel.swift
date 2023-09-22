//
//  CameraViewModel.swift
//  Skinatics
//
//  Created by Nhii on 23/9/2023.
//

import Foundation
import UIKit
import AVFoundation

enum ScannerType: String {
    case text, barcode
}

enum CameraScannerAccessStatus {
    case noCameraAccess
    case noCameraAvailable
    case cameraAvailable
    case notDetermined
}

@MainActor
final class CameraViewModel: ObservableObject {
    
    @Published var accessStatus: CameraScannerAccessStatus = .notDetermined
    
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
                    self.accessStatus = .cameraAvailable
                } else {
                    self.accessStatus = .noCameraAccess
                }
            })
            
        case .authorized:
            accessStatus = .cameraAvailable
            
        @unknown default:
            return
        }
    }
}
