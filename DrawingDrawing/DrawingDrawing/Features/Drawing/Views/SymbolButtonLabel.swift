//
//  SymbolButtonLabel.swift
//  DrawingDrawing
//
//  Created by 조재흥 on 2021/05/30.
//

import SwiftUI

struct SymbolButtonLabel: View {
    
    let symbolName: String

    var body: some View {
        Image(systemName: symbolName)
            .foregroundColor(.white)
            .frame(width: 44, height: 44, alignment: .center)
            .background(Color(UIColor.systemGray2))
            .cornerRadius(12)
    }
}


struct SymbolButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        SymbolButtonLabel(symbolName: "star")
    }
}
