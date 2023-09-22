//
//  CameraView.swift
//  Skinatics
//
//  Created by Nhii on 23/9/2023.
//

import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    @Binding var photo: UIImage
    @Environment(\.dismiss) private var dismiss
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    // coordinate/ perform all camera-related actions
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: CameraView
        
        init(parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.photo = image
            }
            parent.dismiss()
        }
    }
}


struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(photo: .constant(UIImage()))
    }
}
