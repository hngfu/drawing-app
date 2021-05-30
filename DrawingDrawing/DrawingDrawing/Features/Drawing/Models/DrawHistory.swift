//
//  DrawHistory.swift
//  DrawingDrawing
//
//  Created by 조재흥 on 2021/05/30.
//

import UIKit

final class DrawHistory {
    var tool: ToolType
    var points = [CGPoint]()
    
    init(tool: ToolType = .pencil) {
        self.tool = tool
    }
}

enum ToolType {
    case pencil
    case eraser
}
