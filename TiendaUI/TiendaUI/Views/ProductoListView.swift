//
//  ProductoListView.swift
//  TiendaUI
//
//  Created by Liquid on 13/3/24.
//

import SwiftUI

struct ProductoListView: View {
    @State private var categoriaSelected = ""
    
    @Environment(ModelData.self) var modelData
    
    var filteredProductos: [ProductosItem] {
        if categoriaSelected.isEmpty {
            return modelData.productos
        } else {
            return modelData.productos.filter { producto in
                producto.category == categoriaSelected
            }
        }
    }
    
    var categorias: Set<String> {
        Set(modelData.productos.map { $0.category })
    }
    
    var body: some View {
        
        NavigationSplitView{
            Picker(selection: $categoriaSelected, content: {
                Text("Selecciona").tag("")
                ForEach(categorias.sorted(), id: \.self){ categoria in
                    Text(categoria).tag(categoria)
                }
            }, label: { Text("Categorias") })
            ForEach(filteredProductos){ producto in
                NavigationLink {
                    ContentView(producto: producto)
                } label: {
                    ItemRow(producto: producto)
                }
            }
            .animation(.default, value: filteredProductos)
                .navigationTitle("Todos los productos")
        } detail: {
            Text("Selecciona un producto")
        }
    }
}

#Preview {
    ProductoListView()
        .environment(ModelData())
        .environmentObject(Favoritos())
}

