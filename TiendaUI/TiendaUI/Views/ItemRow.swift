//
//  ItemRow.swift
//  TiendaUI
//
//  Created by dam2 on 19/2/24.
//

import SwiftUI

struct ItemRow: View {
    let productos: ProductosItem
    var body: some View {
        let imagenUrl = URL(string: productos.image)
        HStack{
            AsyncImage(
                url: imagenUrl, content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 100, maxHeight: 100)
                },
                placeholder:{
                    ProgressView()
                }
                
            ).clipShape(Circle())
                .overlay(Circle().stroke(.black, lineWidth: 1))
                .shadow(radius: 5)
                .frame(width: 100, height: 100)
            
            VStack(alignment: .leading){
                Text(productos.title)
                    .font(.headline)
                Text("\(productos.price, specifier: "%.2f") €")
            }
            Spacer()
            Text(productos.category)
        }
    }
}

#Preview {
    ItemRow(productos: ProductosItem.example)
}
