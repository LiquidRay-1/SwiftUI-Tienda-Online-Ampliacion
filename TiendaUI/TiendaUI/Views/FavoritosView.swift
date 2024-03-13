//
//  FavoritosView.swift
//  TiendaUI
//
//  Created by Ivan on 9/3/24.
//

import SwiftUI

struct FavoritosView: View {
    
    @Environment(ModelData.self) var modelData
    @EnvironmentObject var favoritos: Favoritos
    
    var favoritosProductos: [ProductosItem] {
        return modelData.productos.filter { producto in
            favoritos.isFavorite(producto)
        }
    }
    
    var body: some View {
        NavigationSplitView{
            List{
                ForEach(favoritosProductos){ producto in
                    NavigationLink {
                        ContentView(producto: producto)
                    } label: {
                        ItemRow(producto: producto)
                    }
                }
            }
                .animation(.default, value: favoritosProductos)
                    .navigationTitle("Productos favoritos")
        } detail: {
            Text("Selecciona un producto")
            }
    }
}

#Preview {
    FavoritosView()
        .environment(ModelData())
        .environmentObject(Favoritos())
}
