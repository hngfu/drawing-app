//
//  DrawingUIView.swift
//  DrawingDrawing
//
//  Created by 조재흥 on 2021/05/30.
//

import UIKit

protocol DrawingUIViewDelegate: AnyObject {
    func drawingUIViewDidBeganTouches(point: CGPoint)
    func drawingUIViewDidMovedTouches(point: CGPoint)
}

final class DrawingUIView: UIView {
    
    var histories: [DrawHistory] = []
    
    weak var delegate: DrawingUIViewDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        draw()
    }
    
    func draw() {
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let historyHandler: (DrawHistory) -> Void = { history in
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
        histories.forEach(historyHandler)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else { return }
        delegate?.drawingUIViewDidBeganTouches(point: point)
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else { return }
        delegate?.drawingUIViewDidMovedTouches(point: point)
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
