//
//  ModelData.swift
//  TiendaUI
//
//  Created by Ivan on 9/3/24.
//

import Foundation

@Observable class ModelData {
    var productos: [ProductosItem] = load("productos.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("No se ha podido encontrar el fichero \(filename)")
    }
    
    do {
        data = try Data(contentsOf: file)
    }catch {
        fatalError("No se puede cargar el fichero \(filename):\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch {
        fatalError("No se puede parsear \(filename) como \(T.self):\n\(error)")
    }
    
}
