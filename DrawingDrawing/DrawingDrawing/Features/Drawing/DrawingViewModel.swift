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
    
    func save() {
        let storage = UserDefaults.standard
        storage.setObject(drewHistories, forKey: Key.drewHistories)
        storage.setObject(drawingHistories, forKey: Key.drawingHistories)
        storage.setObject(tool, forKey: Key.tool)
    }
    
    func load() {
        let storage = UserDefaults.standard
        if let drewHistories = storage.getObject(forKey: Key.drewHistories, castTo: [DrawHistory].self) {
            self.drewHistories = drewHistories
        }
        if let drawingHistories = storage.getObject(forKey: Key.drawingHistories, castTo: [DrawHistory].self) {
            self.drawingHistories = drawingHistories
        }
        if let tool = storage.getObject(forKey: Key.tool, castTo: ToolType.self) {
            self.tool = tool
        }
    }
    
    enum Key {
        static let drewHistories = "drewHistories"
        static let drawingHistories = "drawingHistories"
        static let tool = "tool"
    }
}
