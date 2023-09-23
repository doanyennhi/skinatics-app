//
//  CameraViewModel.swift
//  Skinatics
//
//  Created by Nhii on 23/9/2023.
//

import Foundation
import UIKit
import AVFoundation

enum CameraAccessStatus {
    case noCameraAccess
    case noCameraAvailable
    case cameraAvailable
    case notDetermined
}

@MainActor
final class CameraViewModel: ObservableObject {
    
    @Published var accessStatus: CameraAccessStatus = .notDetermined
    
    func requestAccessStatus() {
        DispatchQueue.main.async {
            guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                self.accessStatus = .noCameraAvailable
                return
            }
            
            switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .restricted, .denied:
                self.accessStatus = .noCameraAccess
                
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                    if granted {
                        self.accessStatus = .cameraAvailable
                    } else {
                        self.accessStatus = .noCameraAccess
                    }
                })
                
            case .authorized:
                self.accessStatus = .cameraAvailable
                
            @unknown default:
                return
            }
        }
    }
}
