//
//  ImagePickerScene.swift
//  DrawingDrawing
//
//  Created by 조재흥 on 2021/05/30.
//

import SwiftUI

struct ImagePickerScene: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerScene>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerScene>) {
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let parent: ImagePickerScene

        init(_ parent: ImagePickerScene) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}


struct ImagePickerScene_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerScene(image: .constant(nil))
    }
}
