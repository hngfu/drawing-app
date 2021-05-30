//
//  DrawingScene.swift
//  DrawingDrawing
//
//  Created by 조재흥 on 2021/05/30.
//

import SwiftUI

struct DrawingScene: View {
    
    var body: some View {
        VStack {
            header
            
            Spacer()
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
                SymbolButtonLabel(symbolName: "arrow.left")
                SymbolButtonLabel(symbolName: "arrow.right")
            }
            
            Spacer()
                .frame(maxWidth: 44)
            
            HStack {
                DefaultButtonLabel(text: "PEN")
                DefaultButtonLabel(text: "ERASE")
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
