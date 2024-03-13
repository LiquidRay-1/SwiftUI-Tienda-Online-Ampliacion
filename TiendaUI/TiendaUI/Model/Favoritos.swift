//
//  Favoritos.swift
//  TiendaUI
//
//  Created by Ivan on 9/3/24.
//

import Foundation

class Favoritos: ObservableObject {
    
    @Published var productos: [ProductosItem] = []
    @Published var favoritosIDs: [Int] = [] {
        didSet {
            UserDefaults.standard.set(favoritosIDs, forKey: "favoritosID")
        }
    }
    
    init() {
        if let guardarID = UserDefaults.standard.array(forKey: "favoritosID") as? [Int] {
            favoritosIDs = guardarID
        }
    }
    
    func toggleFavorite(for producto: ProductosItem) {
        if favoritosIDs.contains(producto.id) {
            favoritosIDs.removeAll(where: { $0 == producto.id })
        } else {
            favoritosIDs.append(producto.id)
        }
    }
    
    func isFavorite(_ producto: ProductosItem) -> Bool {
        return favoritosIDs.contains(producto.id)
    }
}
