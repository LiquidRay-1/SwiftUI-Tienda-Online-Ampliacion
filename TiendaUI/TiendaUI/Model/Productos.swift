//
//  Productos.swift
//  TiendaUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ProductosItem: Decodable, Hashable, Identifiable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String 
    var image: String
    var rating: Rating
    
    var imageUrl: URL {
        URL(string: image)!
    }
    
    #if DEBUG
    static let example = ProductosItem(id: 1, title: "Camiseta", price: 109.95, description: "Camiseta para salir con tus amigos y pasarlo bien", category: "men's clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 9.65, count: 120))
    #endif
}

struct Rating: Decodable, Hashable {
    var rate: Double
    var count: Int
}

