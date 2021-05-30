//
//  DrawingScene.swift
//  DrawingDrawing
//
//  Created by 조재흥 on 2021/05/30.
//

import SwiftUI

struct DrawingScene: View {
    
    @ObservedObject private var viewModel = DrawingViewModel()
    @State private var backgroundImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack(spacing: 0) {
            header
            drawing
        }
    }
    
    private var header: some View {
        HStack {
            HStack {
                Button(action: {
                    viewModel.save()
                    saveImage()
                }, label: {
                    DefaultButtonLabel(text: "SAVE")
                })
                
                Button(action: {
                    viewModel.load()
                    loadImage()
                }, label: {
                    DefaultButtonLabel(text: "LOAD")
                })
            }
            
            Spacer()
                .frame(maxWidth: 88)
            
            Button(action: {
                showingImagePicker.toggle()
            }, label: {
                DefaultButtonLabel(text: "ADD")
            })
            .sheet(isPresented: $showingImagePicker) {
                ImagePickerScene(image: $backgroundImage)
            }
            
            Spacer()
                .frame(maxWidth: .infinity)
            
            HStack {
                Button(action: {
                    viewModel.undo()
                }, label: {
                    SymbolButtonLabel(symbolName: "arrow.left")
                })
                .disabled(viewModel.canUndo == false)
                
                Button(action: {
                    viewModel.redo()
                }, label: {
                    SymbolButtonLabel(symbolName: "arrow.right")
                })
                .disabled(viewModel.canRedo == false)
            }
            
            Spacer()
                .frame(maxWidth: 44)
            
            HStack {
                Button(action: {
                    viewModel.set(tool: .pencil)
                }, label: {
                    DefaultButtonLabel(text: "PEN")
                })
                
                Button(action: {
                    viewModel.set(tool: .eraser)
                }, label: {
                    DefaultButtonLabel(text: "ERASE")
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(UIColor.systemGray4))
    }
    
    private var drawing: some View {
        ZStack {
            if let image = backgroundImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            DrawingView(histories: $viewModel.drewHistories,
                        tool: $viewModel.tool)
        }
    }
    
    //MARK: - Methods
    private func saveImage() {
        if let image = backgroundImage,
           let data = UIImage.jpegData(image)(compressionQuality: 0.1) {
            UserDefaults.standard.set(data, forKey: "image")
        }
    }
    
    private func loadImage() {
        if let data = UserDefaults.standard.object(forKey: "image") as? NSData,
           let image = UIImage(data: data as Data) {
            backgroundImage = image
        }
    }
}

struct DrawingScene_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DrawingScene()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            
            DrawingScene()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
            
            DrawingScene()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 mini"))
            
        }
    }
}
