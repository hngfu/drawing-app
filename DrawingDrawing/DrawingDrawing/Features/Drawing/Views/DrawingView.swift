//
//  DrawingView.swift
//  DrawingDrawing
//
//  Created by 조재흥 on 2021/05/30.
//

import SwiftUI

struct DrawingView: UIViewRepresentable {
    func makeUIView(context: Context) -> DrawingUIView {
        DrawingUIView()
    }
    
    func updateUIView(_ uiView: DrawingUIView, context: Context) {
        
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}

final class DrawingUIView: UIView {
    
    var histories = [DrawHistory]()
    var tool: ToolType = .pencil
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        draw()
    }
    
    func draw() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        for history in histories {
            for (index, point) in history.points.enumerated() {
                if index == 0 {
                    context.move(to: point)
                } else {
                    context.addLine(to: point)
                }
            }
            context.setLineWidth(2.0)
            context.setLineCap(.round)
            context.setBlendMode(history.tool == .pencil ? .normal : .clear)
            context.setStrokeColor(UIColor.black.cgColor)
            context.strokePath()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else { return }
        let history = DrawHistory()
        history.points.append(point)
        histories.append(history)
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else { return }
        histories.last?.points.append(point)
        setNeedsDisplay()
    }
    
    //MARK: - Initial
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .clear
    }
}
