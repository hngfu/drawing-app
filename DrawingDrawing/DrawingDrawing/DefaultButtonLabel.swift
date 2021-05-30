//
//  DefaultButtonLabel.swift
//  DrawingDrawing
//
//  Created by 조재흥 on 2021/05/30.
//

import SwiftUI

struct DefaultButtonLabel: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 13))
            .foregroundColor(.white)
            .frame(width: 44, height: 44, alignment: .center)
            .background(Color(UIColor.systemGray2))
            .cornerRadius(12)
    }
}

struct DefaultButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        DefaultButtonLabel(text: "SAVE")
    }
}
