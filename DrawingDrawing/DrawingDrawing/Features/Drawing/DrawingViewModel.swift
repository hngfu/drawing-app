//
//  DrawingViewModel.swift
//  DrawingDrawing
//
//  Created by 조재흥 on 2021/05/30.
//

import Foundation

final class DrawingViewModel: ObservableObject {
    
    @Published var histories = [DrawHistory]()
    private(set) var tool: ToolType = .pencil
    
    func set(tool: ToolType) {
        self.tool = tool
    }
}
