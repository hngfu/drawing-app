//
//  UserDefaults+Codable.swift
//  DrawingDrawing
//
//  Created by 조재흥 on 2021/05/30.
//

import Foundation

extension UserDefaults {
    func setObject<Object>(_ object: Object, forKey: String) where Object: Encodable {
        let encoder = JSONEncoder()
        guard let data = try? encoder.encode(object) else { return }
        set(data, forKey: forKey)
    }
    
    func getObject<Object>(forKey: String, castTo type: Object.Type) -> Object? where Object: Decodable {
        guard let data = data(forKey: forKey) else { return nil }
        let decoder = JSONDecoder()
        let object = try? decoder.decode(type, from: data)
        return object
    }
}
