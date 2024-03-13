//
//  List.swift
//  TiendaUI
//
//  Created by Ivan on 9/3/24.
//

import Foundation

class List: ObservableObject {
    
    @Published var items = [ProductosItem]()
    
    var total: Double {
        if items.count > 0 {
            return items.reduce(0){ $0 + $1 .price }
        } else {
            return 0
        }
    }
    
    func add(item: ProductosItem){
        items.append(item)
    }
    
    func remove(item: ProductosItem){
        if let index = items.firstIndex(of: item){
            items.remove(at: index)
        }
    }
    
}
