//
//  ImagePickerView.swift
//  GameStream
//
//  Created by Crist on 16/11/2022.
//

import SwiftUI
import UIKit
import FirebaseStorage

struct ImagePickerView: UIViewControllerRepresentable {
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var imageUrl: String?
    @Binding var isPresented: Bool

    func makeCoordinator() -> ImagePickerUrlViewCoordinator {
        return ImagePickerUrlViewCoordinator(imageUrl: $imageUrl, isPresented: $isPresented)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        return pickerController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to update here
    }
}

class ImagePickerUrlViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @Binding var imageUrl: String?
    @Binding var isPresented: Bool

    init(imageUrl: Binding<String?>, isPresented: Binding<Bool>) {
        self._imageUrl = imageUrl
        self._isPresented = isPresented
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let storageRef = Storage.storage().reference()
            let imageData = image.jpegData(compressionQuality: 0.8)
            guard imageData != nil else {
                return
            }
            let path = "profilePhotos/\(UUID().uuidString).jpg"
            let fileRef = storageRef.child(path)
            fileRef.putData(imageData!) { metadata, error in
                if error == nil && metadata != nil {
                    let islandRef = storageRef.child(path)
                    islandRef.downloadURL { url, error in
                        if error == nil && url != nil {
                            self.imageUrl = url?.absoluteString
                        }
                    }
                }
            }
        }
        self.isPresented = false
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
}
