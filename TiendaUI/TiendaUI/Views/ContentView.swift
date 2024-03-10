//
//  ContentView.swift
//  TiendaUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ContentView: View {
    
    let productos: [ProductosItem] = Bundle.main.decode([ProductosItem].self, from: "productos.json")
    
    var body: some View {
        NavigationStack {
            List{
            ForEach(productos) { producto in
                NavigationLink(destination: ItemDetail(productos: producto)) {
                    ItemRow(productos: producto)
                }
            }
            .navigationTitle("Productos")
            }
        }
    }
}


#Preview {
    ContentView()
}
