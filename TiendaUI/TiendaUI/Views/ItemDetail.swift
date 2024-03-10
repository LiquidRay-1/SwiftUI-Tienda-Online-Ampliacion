//
//  ItemDetail.swift
//  TiendaUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ItemDetail: View {
    let productos: ProductosItem
    var body: some View {
        let imagenUrl = URL(string: productos.image)
        VStack{
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(
                    url: imagenUrl, content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 500, maxHeight: 500)
                    },
                    placeholder:{
                        ProgressView()
                    }
                )
                    .scaledToFit()
            }
            Text("Rate de los usuarios: \(productos.rating.rate, specifier: "%.1f")/5")
            Text(productos.description)
                .padding()
            Button("Comprar") {
                print("Producto \(productos.title) comprado")
            }
            Spacer()
        }
        .navigationTitle(productos.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ItemDetail(productos: ProductosItem.example)
}
