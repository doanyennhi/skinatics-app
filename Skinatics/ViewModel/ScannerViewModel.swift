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
    @Published var isLoading: Bool = false
    @Published var showNextView: Bool = false
    @Published var showAlert: Bool = false
    @Published var result = ""
    
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
        
        //    func display() {
        //        var names = [Ingredient(name: "Niacinamide", description: "")]
        //        let name = ingredients.filter { $0.name == search }
        //        names.append(contentsOf: name)
        //        print(names)
        //    }

    }
    
    func getProductByBarcode(scannedItem: String) async {
        isLoading = true
        guard let request = setRequestHeader(link: "https://sephora.p.rapidapi.com/products/v2/search-by-barcode?upcs=\(scannedItem)&country=AU&language=en-AU") else { return }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let res = response as? HTTPURLResponse else { return }
            guard let data = data else { return }
            
            do {
                // get error message if request unsuccessful
                if (400...499).contains(res.statusCode) {
                    let decodedData = try JSONDecoder().decode(Error.self, from: data)
                    DispatchQueue.main.async {
                        print(decodedData)
                        self.isLoading = false
                        self.showAlert = true
                    }
                } else {
                    // decode data
                    let decodedData = try JSONDecoder().decode(ProductSearch.self, from: data)
                    
                    // send task back to main thread
                    DispatchQueue.main.async {
                        self.result = decodedData.data.attributes.productId
                        print(self.result)
                        self.showNextView = !self.result.isEmpty
                        self.isLoading = false
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
