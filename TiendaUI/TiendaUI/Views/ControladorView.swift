//
//  ControladorView.swift
//  TiendaUI
//
//  Created by Liquid on 13/3/24.
//

import SwiftUI

struct ControladorView: View {
    
    @Environment(ModelData.self) var modelData
    @EnvironmentObject var favoritos: Favoritos
    @EnvironmentObject var lista: Lista
    
    var body: some View {
        TabView {
            ProductoListView()
                .tabItem {
                    Label("Productos", systemImage: "bag")
                }
            PedidoView()
                .tabItem {
                    Label("Carrito", systemImage: "cart")
                }
            FavoritosView()
                .tabItem {
                    Label("Favoritos", systemImage: "star")
                }
        }
    }
}

#Preview {
    ControladorView()
        .environment(ModelData())
        .environmentObject(Favoritos())
        .environmentObject(Lista())
}

