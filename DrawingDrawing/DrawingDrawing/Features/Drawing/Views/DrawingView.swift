//
//  DrawingView.swift
//  DrawingDrawing
//
//  Created by 조재흥 on 2021/05/30.
//

import SwiftUI

struct DrawingView: UIViewRepresentable {
    
    @Binding var histories: [DrawHistory]
    @Binding var tool: ToolType
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> DrawingUIView {
        let drawingUIView = DrawingUIView()
        drawingUIView.delegate = context.coordinator
        return drawingUIView
    }
    
    func updateUIView(_ uiView: DrawingUIView, context: Context) {
        uiView.histories = histories
        uiView.setNeedsDisplay()
    }
    
    final class Coordinator: DrawingUIViewDelegate {
        
        private let parent: DrawingView
        
        init(_ drawingView: DrawingView) {
            self.parent = drawingView
        }
        
        func drawingUIViewDidBeganTouches(point: CGPoint) {
            let history = DrawHistory(tool: parent.tool)
            history.points.append(point)
            parent.histories.append(history)
        }
        
        func drawingUIViewDidMovedTouches(point: CGPoint) {
            parent.histories.last?.points.append(point)
        }
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView(histories: .constant([]), tool: .constant(.pencil))
    }
}
