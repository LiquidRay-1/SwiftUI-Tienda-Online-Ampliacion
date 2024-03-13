//
//  FavoriteButton.swift
//  TiendaUI
//
//  Created by Ivan on 9/3/24.
//

import SwiftUI

struct FavoriteButton: View {
    
    @State var isSet: Bool
    @EnvironmentObject var favoritos: Favoritos
    @Environment(ModelData.self) var modelData
    
    var producto: ProductosItem

    var body: some View {
        Button {
            isSet.toggle()
            favoritos.toggleFavorite(for: producto)
        } label: {
            if isSet {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            } else {
                Image(systemName: "star")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    FavoriteButton(isSet: true, producto: ModelData().productos[0])
        .environmentObject(Favoritos())
        .environment(ModelData())
}
