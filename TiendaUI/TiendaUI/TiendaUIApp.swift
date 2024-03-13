//
//  TiendaUIApp.swift
//  TiendaUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

@main
struct TiendaUIApp: App {
    @State private var modelData = ModelData()
    
    var favoritos = Favoritos()
    
    var lista = List()
    
    var body: some Scene {
        WindowGroup {
            ControladorView()
                .environmentObject(lista)
                .environment(modelData)
                .environmentObject(favoritos)
        }
    }
}
