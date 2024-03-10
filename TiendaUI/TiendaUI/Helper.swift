//
//  Helper.swift
//  TiendaUI
//
//  Created by dam2 on 19/2/24.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("No se ha encontrado \(file)")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("No se ha podido cargar \(file)")
        }
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("No se ha podido decodificar \(file)")
        }
        return loaded
    }
}
