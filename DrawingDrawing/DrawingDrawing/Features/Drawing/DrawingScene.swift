//
//  DrawingScene.swift
//  DrawingDrawing
//
//  Created by 조재흥 on 2021/05/30.
//

import SwiftUI

struct DrawingScene: View {
    
    @ObservedObject var viewModel = DrawingViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            header
            
            DrawingView(histories: $viewModel.drewHistories, tool: $viewModel.tool)
        }
    }
    
    var header: some View {
        HStack {
            HStack {
                DefaultButtonLabel(text: "SAVE")
                DefaultButtonLabel(text: "LOAD")
            }
            
            Spacer()
                .frame(maxWidth: 88)
            
            DefaultButtonLabel(text: "ADD")
            
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
