//
//  CameraView.swift
//  Skinatics
//
//  Created by Nhii on 5/9/2023.
//

import SwiftUI

struct CameraView: View {
    @State var showCamera: Bool = false
    @State var currentPhoto = UIImage()
    
    var body: some View {
        VStack {
            Image(uiImage: currentPhoto)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                print("Scanning")
            }, label: {
                Text("Scan barcode")
            })
            .buttonStyle(SecondaryButtonStyle())
            
            Button(action: {
                showCamera = true
            }, label: {
                Text("Take skin photo")
            })
            .buttonStyle(PrimaryButtonStyle())
        }
        .modifier(ScreenModifier())
        .fullScreenCover(isPresented: $showCamera, content: { Camera(photo: $currentPhoto, sourceType: .photoLibrary) })
    }
}


struct Camera: UIViewControllerRepresentable {
    @Binding var photo: UIImage
    @Environment(\.dismiss) private var dismiss
    
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Camera>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<Camera>) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: Camera
        
        init(parent: Camera) {
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
        CameraView()
    }
}
