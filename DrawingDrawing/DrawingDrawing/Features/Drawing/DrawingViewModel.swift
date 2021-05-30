//
//  DrawingViewModel.swift
//  DrawingDrawing
//
//  Created by 조재흥 on 2021/05/30.
//

import Foundation

final class DrawingViewModel: ObservableObject {
    
    @Published var drewHistories = [DrawHistory]()
    private var drawingHistories = [DrawHistory]()
    @Published var tool: ToolType = .pencil
    
    var canUndo: Bool {
        drewHistories.isEmpty == false
    }
    
    var canRedo: Bool {
        drawingHistories.isEmpty == false
    }
    
    func undo() {
        guard canUndo else { return }
        guard let history = drewHistories.popLast() else { return }
        drawingHistories.append(history)
    }
    
    func redo() {
        guard canRedo else { return }
        guard let history = drawingHistories.popLast() else { return }
        drewHistories.append(history)
    }
    
    func set(tool: ToolType) {
        self.tool = tool
    }
}
