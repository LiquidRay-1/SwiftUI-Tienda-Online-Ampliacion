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
    @EnvironmentObject var lista: List
    
    var body: some View {
        TabView {
            ProductoListView()
                .tabItem {
                    Label("Productos", systemImage: "list.dash")
                }
            PedidoView()
                .tabItem {
                    Label("Pedido", systemImage: "cart")
                }
            FavoritosView()
                .tabItem {
                    Label("Favoritos", systemImage: "pencil")
                }
        }
    }
}

#Preview {
    ControladorView()
        .environment(ModelData())
        .environmentObject(Favoritos())
        .environmentObject(List())
}

