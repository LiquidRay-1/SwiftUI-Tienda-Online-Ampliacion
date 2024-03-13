//
//  ItemRow.swift
//  TiendaUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ItemRow: View {
    
    @EnvironmentObject var favoritos: Favoritos
    
    var producto: ProductosItem
    
    var body: some View {
        HStack {
            AsyncImage (
                url: producto.imageUrl,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    ProgressView()
                }
            )
            .frame(maxWidth: 50, minHeight: 50)
            VStack(alignment: .leading) {
                Text(producto.title)
                    .font(.callout)
                Text(producto.category)
                    .font(.headline)
            }
            Spacer()
            if favoritos.isFavorite(producto) {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
            Text(String(format: "%.2f", producto.price) + "€")
                .font(.callout)
        }
    }
}

struct ListaView: View {
    
    @EnvironmentObject var favoritos: Favoritos
    
    var productos: [ProductosItem]
    
    var body: some View {
        List(productos) { producto in
            ItemRow(producto: producto)
        }
    }
}

#Preview("Lista") {
    ListaView(productos: ModelData().productos)
        .environmentObject(Favoritos())
}
